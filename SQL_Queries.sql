-- gets artists first and last names where they have an album
SELECT Artists.firstName, Artists.lastName
FROM Creates
INNER JOIN Artists ON Creates.albumID = Artists.artistID;

 -- gets concert location for users who have listened to more than 70 albums
SELECT Concerts.location
FROM users
INNER JOIN Concerts ON users.userID = Concerts.userID AND users.albumsListenedTo > 70;

-- gets everything from concerts table
SELECT * 
FROM users;

-- Gets emails of all users who are using spotify and are subscribed to out website
SELECT users.email
FROM interactsWith
INNER JOIN users ON interactsWith.service = "Spotify" AND users.subscriptionStatus = 1;

-- gets total number of songs listened to that have a rating higher than 2
SELECT SUM(totalNumOfListens)
FROM Albums
WHERE totalRating >2;

-- gets all from artists table
SELECT * 
FROM Artists

-- gets datereleased from albums
SELECT dateReleased
FROM Albums
