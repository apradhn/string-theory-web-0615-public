function sortByAppearance(charactersToSort, text) {
  var textCharacters = text.split("");
  var textCharacter;
  var charactersToSort = charactersToSort.split("");
  var sortCharacter;
  var sortedCharacters;

  var characters_hash = charactersToSort.map(function(elem) {
    var new_elem = {};
    new_elem.character = elem;
    new_elem.count = 0;
    return new_elem;
  });

  for (var i = 0; i < textCharacters.length; i++) {
    textCharacter = textCharacters[i]
    for (var j = 0; j < charactersToSort.length; j++) {
      var sortCharacter = charactersToSort[j];
      if (textCharacter === sortCharacter) {
        characters_hash[j].count += 1;    
      }
    };
  };

  sortedCharacters = characters_hash.sort(function(a, b) {
    return b.count - a.count;
  })
  .map(function(elem) {
    return elem.character;
  })
  .join("");

  return sortedCharacters;
}