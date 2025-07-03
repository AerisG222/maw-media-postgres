-- verify hunspell (should return 'story')
select ts_lexise('english', 'stories');

-- verify synonyms
select ts_lexise('english', 'alyssa');
select ts_lexise('english', 'sasa');
