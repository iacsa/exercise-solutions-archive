template<typename T>
void printArray(vector<T> values) {
  for (auto iter = values.begin(); iter != values.end(); iter++) {
    cout << *iter << endl;
  }
}
