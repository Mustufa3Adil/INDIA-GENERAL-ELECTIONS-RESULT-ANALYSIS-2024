INDIA GENERAL ELECTIONS RESULT ANALYSIS 2024

CREATE TABLE states (
    state_id TEXT PRIMARY KEY,
    state TEXT
);


CREATE TABLE partywise_results (
    party TEXT,
    won INTEGER,
    party_id INTEGER PRIMARY KEY
);


CREATE TABLE constituencywise_results (
    s_no INTEGER,
    parliament_constituency TEXT,
    constituency_name TEXT,
    winning_candidate TEXT,
    total_votes INTEGER,
    margin INTEGER,
    constituency_id TEXT PRIMARY KEY,
    party_id INTEGER,
    FOREIGN KEY (party_id) REFERENCES partywise_results(party_id)
);

CREATE TABLE constituencywise_details (
    s_n INTEGER,
    candidate TEXT,
    party TEXT,
    evm_votes INTEGER,
    postal_votes INTEGER,
    total_votes INTEGER,
    percent_of_votes DOUBLE PRECISION,
    constituency_id TEXT,
    FOREIGN KEY (constituency_id) REFERENCES constituencywise_results(constituency_id)
);

CREATE TABLE statewise_results (
    constituency TEXT,
    const_no INTEGER,
    parliament_constituency TEXT,
    leading_candidate TEXT,
    trailing_candidate TEXT,
    margin INTEGER,
    status TEXT,
    state_id TEXT,
    state TEXT,
    FOREIGN KEY (state_id) REFERENCES states(state_id)
	
	
);





Q1.	Total Seats

SELECT DISTINCT COUNT (Parliament_Constituency) AS Total_Seats
FROM constituencywise_results
	
	
Q2.What is the total number of seats available for elections in each state

SELECT s.State AS State_Name,
COUNT(cr.Constituency_ID) AS Total_Seats_Available
FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
GROUP BY s.State
ORDER BY s.State;


TQ3.otal Seats Won by NDA Allianz

SELECT  SUM(CASE WHEN party IN 
( 
 'Bharatiya Janata Party - BJP', 
 'Telugu Desam - TDP', 
 'Janata Dal  (United) - JD(U)',
 'Shiv Sena - SHS', 
 'AJSU Party - AJSUP', 
 'Apna Dal (Soneylal) - ADAL', 
 'Asom Gana Parishad - AGP',
 'Hindustani Awam Morcha (Secular) - HAMS', 
 'Janasena Party - JnP', 
 'Janata Dal  (Secular) - JD(S)',
 'Lok Janshakti Party(Ram Vilas) - LJPRV', 
 'Nationalist Congress Party - NCP',
 'Rashtriya Lok Dal - RLD', 
 'Sikkim Krantikari Morcha - SKM'
) 
THEN Won
ELSE 0 
END) 
AS NDA_Total_Seats_Won
FROM partywise_results


Q4.Seats Won by NDA Allianz Parties

SELECT party as Party_Name,won as Seats_Won
FROM partywise_results
WHERE party IN 
(
 'Bharatiya Janata Party - BJP', 
 'Telugu Desam - TDP', 
 'Janata Dal  (United) - JD(U)',
 'Shiv Sena - SHS', 
 'AJSU Party - AJSUP', 
 'Apna Dal (Soneylal) - ADAL', 
 'Asom Gana Parishad - AGP',
 'Hindustani Awam Morcha (Secular) - HAMS', 
 'Janasena Party - JnP', 
 'Janata Dal  (Secular) - JD(S)',
 'Lok Janshakti Party(Ram Vilas) - LJPRV', 
 'Nationalist Congress Party - NCP',
 'Rashtriya Lok Dal - RLD', 
 'Sikkim Krantikari Morcha - SKM'
)
ORDER BY Seats_Won DESC


Q5.Total Seats Won by I.N.D.I.A. Allianz

SELECT SUM(CASE WHEN party IN 
(
 'Indian National Congress - INC',
 'Aam Aadmi Party - AAAP',
 'All India Trinamool Congress - AITC',
 'Bharat Adivasi Party - BHRTADVSIP',
 'Communist Party of India  (Marxist) - CPI(M)',
 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
 'Communist Party of India - CPI',
 'Dravida Munnetra Kazhagam - DMK',
 'Indian Union Muslim League - IUML',
 'Nat`Jammu & Kashmir National Conference - JKN',
 'Jharkhand Mukti Morcha - JMM',
 'Jammu & Kashmir National Conference - JKN',
 'Kerala Congress - KEC',
 'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
 'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
 'Rashtriya Janata Dal - RJD',
 'Rashtriya Loktantrik Party - RLTP',
 'Revolutionary Socialist Party - RSP',
  'Samajwadi Party - SP',
  'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
  'Viduthalai Chiruthaigal Katchi - VCK'
) 
THEN WoN
ELSE 0 
END) 
AS INDIA_Total_Seats_Won
FROM partywise_results

Q6.Seats Won by I.N.D.I.A. Allianz Parties

SELECT party as Party_Name, won as Seats_Won
FROM partywise_results
WHERE party IN 
(
 'Indian National Congress - INC',
 'Aam Aadmi Party - AAAP',
 'All India Trinamool Congress - AITC',
 'Bharat Adivasi Party - BHRTADVSIP',
 'Communist Party of India  (Marxist) - CPI(M)',
 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
 'Communist Party of India - CPI',
 'Dravida Munnetra Kazhagam - DMK',
 'Indian Union Muslim League - IUML',
 'Nat`Jammu & Kashmir National Conference - JKN',
 'Jharkhand Mukti Morcha - JMM',
 'Jammu & Kashmir National Conference - JKN',
 'Kerala Congress - KEC',
 'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
 'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
 'Rashtriya Janata Dal - RJD',
 'Rashtriya Loktantrik Party - RLTP',
 'Revolutionary Socialist Party - RSP',
 'Samajwadi Party - SP',
 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
 'Viduthalai Chiruthaigal Katchi - VCK'
)
ORDER BY Seats_Won DESC


Q7.Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);

I.N.D.I.A Allianz

UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);


NDA Allianz

UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);


OTHER

UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;


Q8.Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

SELECT p.party_alliance,
COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
WHERE p.party_alliance IN ('NDA', 'I.N.D.I.A', 'OTHER')
GROUP BY p.party_alliance
ORDER BY Seats_Won DESC;




--Q9.Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?

SELECT cr.Winning_Candidate, p.Party, p.party_alliance, cr.Total_Votes, cr.Margin, cr.Constituency_Name, s.State
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Uttar Pradesh' AND cr.Constituency_Name = 'AMETHI';

Q10.What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

SELECT cd.Candidate, cd.Party, cd.EVM_Votes, cd.Postal_Votes, cd.Total_Votes, cr.Constituency_Name
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE cr.Constituency_Name = 'MATHURA'
ORDER BY cd.Total_Votes DESC;


Q11.Which parties won the most seats in s State, and how many seats did each party win?

SELECT p.Party,
COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.state = 'Andhra Pradesh'
GROUP BY p.Party
ORDER BY Seats_Won DESC;


Q12.What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

SELECT s.State AS State_Name,
SUM(CASE WHEN p.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
SUM(CASE WHEN p.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
SUM(CASE WHEN p.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE p.party_alliance IN ('NDA', 'I.N.D.I.A',  'OTHER')  -- Filter for NDA and INDIA alliances
GROUP BY s.State
ORDER BY s.State;


Q13.Which candidate received the highest number of EVM votes in each constituency (Top 10)?

SELECT TOP 10 cr.Constituency_Name, cd.Constituency_ID, cd.Candidate, cd.EVM_Votes
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE cd.EVM_Votes = 
(
SELECT MAX(cd1.EVM_Votes)
FROM constituencywise_details cd1
WHERE cd1.Constituency_ID = cd.Constituency_ID
)
ORDER BY cd.EVM_Votes DESC;


Q14.Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

WITH RankedCandidates AS 
(
SELECT cd.Constituency_ID, cd.Candidate, cd.Party, cd.EVM_Votes, cd.Postal_Votes, cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Maharashtra'
)
SELECT cr.Constituency_Name,
MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM RankedCandidates rc
JOIN constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY cr.Constituency_Name
ORDER BY cr.Constituency_Name;



Q15.For the state of Maharashtra, what are the total number of seats, total number of candidates, total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?

SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
    COUNT(DISTINCT p.Party) AS Total_Parties,
    SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
    SUM(cd.EVM_Votes) AS Total_EVM_Votes,
    SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM constituencywise_results cr
JOIN constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
WHERE s.State = 'Maharashtra';


