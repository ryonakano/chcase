/*
 * SPDX-License-Identifier: LGPL-3.0-or-later
 * SPDX-FileCopyrightText: 2020-2023 Ryo Nakano <ryonakaknock3@gmail.com>
 */

namespace ChCase.PatternType {
    public class Sentence : Pattern {
        public Sentence (Case result_case) {
            base (result_case);
        }

        protected override void to_space_separated () {
            detect_patterns.append_val ("^([A-Z])");
            replace_patterns.append_val ("\\l\\1");
        }

        protected override void to_camel () {
            detect_patterns.append_val ("^([A-Z])");
            replace_patterns.append_val ("\\l\\1");
            detect_patterns.append_val (" (.)");
            replace_patterns.append_val ("\\u\\1");
        }

        protected override void to_pascal () {
            detect_patterns.append_val (" (.)");
            replace_patterns.append_val ("\\u\\1");
        }

        protected override void to_snake () {
            detect_patterns.append_val ("^([A-Z])");
            replace_patterns.append_val ("\\l\\1");
            detect_patterns.append_val (" (.)");
            replace_patterns.append_val ("_\\1");
        }

        protected override void to_kebab () {
            detect_patterns.append_val ("^([A-Z])");
            replace_patterns.append_val ("\\l\\1");
            detect_patterns.append_val (" (.)");
            replace_patterns.append_val ("-\\1");
        }

        protected override void to_sentence () {
            // The chosen result case is the same with source case, does nothing.
        }
    }
}
