CREATE DATABASE maw_media;

\c maw_media

CREATE ROLE maw_media;

CREATE TEXT SEARCH DICTIONARY maw_media_thesaurus
(
    TEMPLATE = thesaurus,
    DictFile = maw_media_thesaurus,
    Dictionary = pg_catalog.english_stem
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
        maw_media_thesaurus,
        english_hunspell,
        english_stem;
