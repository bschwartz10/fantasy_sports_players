
# Fantasy Sports Players

## Overview

* This application consumes the CBS fantasy sports api for baseball, basketball and football and creates customized endpoints with the players' data. The return format for all endpoints is JSON.

![Alt text](./app/assets/images/home.png?raw=true "Entrance")

![Alt text](./app/assets/images/kp.png?raw=true "Entrance")

The root path is set to ```players#show, id: '8916'```

## Setup

To set up a local copy of this project, perform the following:

Clone the repo in your terminal:
```
git clone https://github.com/bschwartz10/fantasy_sports_players.git
```

Navigate into the project:
```
cd fantasy_sports_players
```
Bundle:
```
bundle install
```

Create, migrate, and import player info into your database:
```
rake db:create
rake db:migrate
rake get_data
```

Run `rspec` in your terminal to ensure all tests are passing.

## Endpoints
You can visit these endpoints to see a JSON response.

In your terminal, start a local server: `rails s`

Open your browser to `localhost:3000`

### Record Endpoints

#### Players
- **<code>GET</code> /api/v1/players/:id**

#### Sports
- **<code>GET</code> /api/v1/sports/baseball**
- **<code>GET</code> /api/v1/sports/football**
- **<code>GET</code> /api/v1/sports/basketball**

### Players Dashboard
- **<code>GET</code> /players/:id**

## Discussion
There were a few design tradeoffs that I made while creating this application.

The first was deciding whether to store the player information from the CBS API in my database or just to use PORO's. The advantages of not storing the information in the database is the data will always be the most up to date. A disadvantage of this approach is I can't use active record methods unless the information is stored in my database. I chose to store the data in my database so I can quickly compute the average for each position using active record instead of hand writing a method using Ruby which would take much longer. Storing the data in the database does run the risk of having stale data though. One solution that could be implemented would be a Cron Job to update the data every hour/day/week to keep the data fresh.

Another decision that I had to make was whether to keep the position attribute on the player or create another table in the database. Originally I kept the position attribute on the player to minimize the amount of tables I had in my database. I ran into issues using this approach when trying to compute the average age for each position. I was accomplishing this by running an average query every time I sent a player object to the serializer. I thought this was a below-par approach since I only really need to compute the average one time for each position whereas I was doing it every time for each player/position. This is why I decided to create a position table in my database and give it an average_age column. Now every time I fetch the data from the CBS endpoint I compute the average once for each position. I then utilize a has_many/belongs_to relationship to quickly fetch the average_age for the players position.
