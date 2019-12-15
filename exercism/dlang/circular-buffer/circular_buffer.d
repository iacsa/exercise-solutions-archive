module circular;

import std.exception;


class Buffer(T) {

  private T[] buffer;
  private size_t capacity;
  private size_t offset;
  private size_t size;


  this(size_t size) {
    buffer.length = size;
    capacity = size;
    offset = 0;
    size = 0;
  }


  void push(T item) {
    if (isFull) {
      throw new Exception("Push called on full Buffer.");
    } else {
      forcePush(item);
    }
  }


  T pop() {
    if (isEmpty) {
      throw new Exception("Pop called on empty Buffer.");
    } else {
      auto result = buffer[readIndex];
      incrementReadIndex();
      return result;
    }
  }


  void forcePush(T item) {
    buffer[writeIndex] = item;
    if (isFull) {
      incrementReadIndex();
    }
    incrementWriteIndex();
  }


  void clear() {
    size = 0;
  }


  private bool isFull() {
    return size >= capacity;
  }


  private bool isEmpty() {
    return size == 0;
  }


  private void incrementReadIndex() {
    offset = (offset + 1) % capacity;
    size = size - 1;
  }
  

  private void incrementWriteIndex() {
    size = size + 1;
  }


  private size_t writeIndex() {
    return (offset + size) % capacity;
  }


  private size_t readIndex() {
    return offset;
  }

}


unittest
{
  immutable int allTestsEnabled = 1;

  // test read empty buffer
  {
    auto myBuffer = new Buffer!(int)(1UL);
    assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
  }

  static if (allTestsEnabled)
  {

    // test write and read back one item
    {
      auto myBuffer = new Buffer!(char)(1);
      myBuffer.push('1');
      assert(myBuffer.pop() == '1');
    }

    // test write and read back multiple items
    {
      auto myBuffer =  new Buffer!(char)(2);
      myBuffer.push('1');
      myBuffer.push('2');
      assert(myBuffer.pop() == '1');
      assert(myBuffer.pop() == '2');
    }

    // test clearing the buffer
    {
      auto myBuffer = new Buffer!(char)(3);
      myBuffer.push('1');
      myBuffer.push('2');
      myBuffer.push('3');

      myBuffer.clear();
      assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
    }

    // test alternate write and read
    {
      auto myBuffer = new Buffer!(char)(2);
      myBuffer.push('1');
      assert(myBuffer.pop() == '1');
      myBuffer.push('2');
      assert(myBuffer.pop() == '2');
    }

    // test read back oldest item
    {
      auto myBuffer = new Buffer!(char)(4);
      myBuffer.push('1');
      myBuffer.push('2');
      myBuffer.pop();
      myBuffer.push('3');
      myBuffer.pop();

      assert(myBuffer.pop() == '3');
    }

    // test write buffer
    {
      auto myBuffer = new Buffer!(char)(3);
      myBuffer.push('1');
      myBuffer.push('2');
      myBuffer.push('3');

      assertThrown(myBuffer.push('4'), "Full buffer should throw exception if new element pushed!");
    }

    // test forcePush full buffer
    {
      auto myBuffer = new Buffer!(char)(3);
      myBuffer.push('1');
      myBuffer.push('2');
      myBuffer.push('3');

      myBuffer.forcePush('A');
      assert(myBuffer.pop() == '2');
      assert(myBuffer.pop() == '3');
      assert(myBuffer.pop() == 'A');
    }

    // test forcePush non-full buffer
    {
      auto myBuffer = new Buffer!(int)(2);
      myBuffer.forcePush(1000);
      myBuffer.forcePush(2000);

      assert(myBuffer.pop() == 1000);
      assert(myBuffer.pop() == 2000);
    }

    // test alternate read and forcePush
    {
      auto myBuffer = new Buffer!(char)(5);
      myBuffer.push('1');
      myBuffer.push('2');
      myBuffer.push('3');
      myBuffer.pop();
      myBuffer.pop();

      myBuffer.push('4');
      myBuffer.pop();

      myBuffer.push('5');
      myBuffer.push('6');
      myBuffer.push('7');
      myBuffer.push('8');
      myBuffer.forcePush('A');
      myBuffer.forcePush('B');

      assert(myBuffer.pop() == '6');
      assert(myBuffer.pop() == '7');
      assert(myBuffer.pop() == '8');
      assert(myBuffer.pop() == 'A');
      assert(myBuffer.pop() == 'B');
      assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
    }

  }

}

void main ()
{
}
