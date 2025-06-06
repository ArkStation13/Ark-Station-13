/**
 * Removes excess whitespace and indentation from the string.
 */
export const multiline = (str) => {
  if (Array.isArray(str)) {
    // Small stub to allow usage as a template tag
    return multiline(str.join(''));
  }
  const lines = str.split('\n');
  // Determine base indentation
  let minIndent;
  for (let line of lines) {
    for (let indent = 0; indent < line.length; indent++) {
      const char = line[indent];
      if (char !== ' ') {
        if (minIndent === undefined || indent < minIndent) {
          minIndent = indent;
        }
        break;
      }
    }
  }
  if (!minIndent) {
    minIndent = 0;
  }
  // Remove this base indentation and trim the resulting string
  // from both ends.
  return lines
    .map((line) => line.substr(minIndent).trimRight())
    .join('\n')
    .trim();
};
