# README
Blackjack By the Book was created to help teach basic blackjack strategy and let players just play blackjack for fun. Players can create an account to keep track of their performance or sign in as a guest. All standard actions are available for the player, such as Hitting, Staying, Doubling, Splitting, and Surrendering, as appropriate. The game is played with six decks of cards, the dealer must draw to 17, and the dealer hits on soft 17.

The backend was developed on Ruby 2.5.1 and Rails 5.2.2, and uses Active Model Serializers and a PostgreSQL Database. Once you've created and migrated the database, you will need to seed it with the "Guest" User (already in the seeds.rb rile); this is necessary so that players can sign in as a guest. For basic auth, BCrypt and JWT were used as well.

The frontend repo can be found here:
https://github.com/mkim4247/blackjack-react-frontend

Below is a demo of the app:
https://www.youtube.com/watch?v=MOIH7OmbQs4
