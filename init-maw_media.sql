CREATE DATABASE maw_media;

\c maw_media

CREATE EXTENSION dict_xsyn;
CREATE ROLE maw_media;

ALTER TEXT SEARCH DICTIONARY xsyn
(
    MATCHSYNONYMS = true,
    RULES = maw_media_xsyn
);

CREATE TEXT SEARCH DICTIONARY english_hunspell (
	template = ispell,
	DictFile = en_us,
	AffFile = en_us,
	StopWords = english
);

-- alter the config to use the ispell and stem (snowball) dictionaries
ALTER TEXT SEARCH CONFIGURATION	english
    ALTER MAPPING FOR
        asciiword,
        asciihword,
        hword_asciipart,
        word,
        hword,
        hword_part
    WITH
        xsyn,
        english_hunspell,
        english_stem;
