class Deque<T> {

  private var node: Node<T>? = null

  fun isEmpty(): Boolean = node == null

  fun push(item: T) = if (isEmpty()) node = Node(item) else node!!.insertBefore(item)

  fun unshift(item: T) {
    push(item)
    node = node!!.prev
  }

  fun pop(): T {
    if (isEmpty()) throw UnsupportedOperationException("Cannot remove element from empty Deque.")

    val (item, _node) = node!!.removeBefore()
    node = _node
    return item
  }

  fun shift(): T {
    node = node?.next
    return pop()
  }
}

private class Node<T>(val item: T) {
  var next: Node<T> = this
  var prev: Node<T> = this

  private constructor(item: T, next: Node<T>, prev: Node<T>) : this(item) {
    this.next = next
    this.prev = prev
  }

  fun insertBefore(item: T) {
    prev.next = Node(item, this, prev)
    prev = prev.next
  }

  fun removeBefore(): Pair<T, Node<T>?> {
    val result_item = prev.item
    var result_node: Node<T>? = null
    if (next != this) {
      prev.prev.next = this
      prev = prev.prev
      result_node = this
    }
    return Pair(result_item, result_node)
  }
}
