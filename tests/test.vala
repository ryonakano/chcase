public static int main (string[] args) {
    var converter = new ChCase.Converter (ChCase.Case.SPACE_SEPARATED, ChCase.Case.CAMEL);
    const string test_text_before = "lorem ipsum, hello world!";
    string test_text_after = converter.convert_case (test_text_before);
    stdout.printf ("%s -> %s\n", test_text_before, test_text_after);
    return 0;
}
