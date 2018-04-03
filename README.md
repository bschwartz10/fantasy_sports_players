
# Fantasy Sports Players

## Overview

* This application consumes the CBS fantasy sports api for baseball, basketball and football and creates customized endpoints with the players' data. The return format for all endpoints is JSON.

![Alt text](./app/assets/images/home.png?raw=true "Entrance")

![Alt text](./app/assets/images/kp.png?raw=true "Entrance")

The root path is set to ```players#show, id: '8910'```

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
rake get_player_data
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
I chose to import the data from the CBS api using a rake task. I would like to point out if this was a live project this data would become stale very quickly. One solution that could be implemented would be a Cron Job to update the data every hour/day/week to keep the data fresh.
