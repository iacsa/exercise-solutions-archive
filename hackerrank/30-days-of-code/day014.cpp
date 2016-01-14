Difference(vector<int>& elements) {
  this->elements = elements;
}

void computeDifference() {
  int min = elements.front();
  int max = elements.front();

  for(auto iter = elements.begin(); iter != elements.end(); iter++) {
    if (*iter > max) { max = *iter; }
    if (*iter < min) { min = *iter; }
  }

  this->maximumDifference = max - min;
}
