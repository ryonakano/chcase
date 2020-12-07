public class Application : GLib.Application {
    public Application () {
        Object (
            application_id: "com.github.ryonakano.chcase-demo",
            flags: GLib.ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        // Declare new instance of Converter with specified cases
        var converter = new ChCase.Converter.with_case (ChCase.Case.SPACE_SEPARATED, ChCase.Case.CAMEL);

        string test_text_before = "this should be converted to camel case";
        string test_text_after = converter.convert_case (test_text_before);
        stdout.printf ("%s -> %s\n", test_text_before, test_text_after);

        // Change source case to PascalCase
        converter.set_source_case (ChCase.Case.PASCAL);
        test_text_before = "ThisShouldBeConvertedToCamelCase";
        test_text_after = converter.convert_case (test_text_before);
        stdout.printf ("%s -> %s\n", test_text_before, test_text_after);

        // Change result case to snake_case
        converter.result_case = ChCase.Case.SNAKE;
        test_text_before = "thisShouldBeConvertedToSnakeCase";
        test_text_after = converter.convert_case (test_text_before);
        stdout.printf ("%s -> %s\n", test_text_before, test_text_after);

        // Change source case to kebab-case
        converter.set_source_case_from_string ("kebab");
        test_text_before = "this-should-be-converted-to-snake-case";
        test_text_after = converter.convert_case (test_text_before);
        stdout.printf ("%s -> %s\n", test_text_before, test_text_after);

        // Change result case to space-separated
        converter.result_case_name = "space_separated";
        test_text_before = "this-should-be-converted-to-space-separated";
        test_text_after = converter.convert_case (test_text_before);
        stdout.printf ("%s -> %s\n", test_text_before, test_text_after);

        // Change source case to Sentence case
        converter.source_case = ChCase.Case.SENTENCE;
        test_text_before = "This should be converted to space separated";
        test_text_after = converter.convert_case (test_text_before);
        stdout.printf ("%s -> %s\n", test_text_before, test_text_after);
    }

    public static int main (string[] args) {
        return new Application ().run (args);
    }
}
