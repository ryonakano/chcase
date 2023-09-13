SRC		= \
		  lib/Case.vala \
		  lib/Converter.vala \
		  lib/PatternType/Pattern.vala \
		  lib/PatternType/Case/Camel.vala \
		  lib/PatternType/Case/Kebab.vala \
		  lib/PatternType/Case/Pascal.vala \
		  lib/PatternType/Case/Sentence.vala \
		  lib/PatternType/Case/Snake.vala \
		  lib/PatternType/Case/SpaceSeparated.vala
TARGET	= chcase
VERSION	= 2.1.0

.PHONY: docs
docs: $(SRC)
	valadoc $^ -o $@ --package-name=$(TARGET) --package-version=$(VERSION) --force
