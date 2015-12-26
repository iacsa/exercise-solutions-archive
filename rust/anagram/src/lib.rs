/* Take a word and a list of possible anagrams,
 * Return a vector of actual anagrams of the first word.
 *
 * Two words are anagrams of one another, exactly when:
 * (1) They have the same length
 * (2) They are not the same
 * (3) They consist of all the same letters
 *
 * Capitalization will be ignored, as it depends on letter order.
 *
 * To make testing for condition (3) easier, we canonicalize all words
 * by sorting their letters. Then (3) <=> canonicalized forms are equal.
 */

pub fn anagrams_for<'a> (word: &str, list: &[&'a str]) -> Vec<&'a str> {
  let lower_word = word.to_lowercase();
  let mut canonical_word: Vec<char> = lower_word.chars().collect();
  canonical_word.sort();
  
  // Iterate over the given word list and keep the anagrams
  list.iter().filter(|&other| {
    let lower_other: String = other.to_lowercase();
    let mut canonical_other: Vec<char> = lower_other.chars().collect();
    canonical_other.sort();

    // Actual test for anagrams. Conditions are in order (1), (2), (3)
    lower_word.len() == lower_other.len() &&   
      lower_word != lower_other &&             
      canonical_word == canonical_other
  }).cloned().collect()
}
