# ChatOnlineApp README

Welcome to ChatOnlineApp! This README provides essential information to help you set up and use the application.

## Prerequisites

To run this application, you'll need the following software installed:

- Ruby 3.1.1
- Ruby on Rails 7.0.8
- PostgreSQL

## Database Setup

To create and set up the database, follow these steps:

1. Create the database:

   ```bash
   rails db:create

2. Apply database migrations:

    ```bash
    rails db:migrate

3. Seed the database with initial data:

    ```bash
    rails db:seed

## Start Application

    ```bash
    rails server


# Using the API

## Get a List of All Chats

  To retrieve a list of all chats using the API, make a GET request to the following endpoint:

    ```bash
    curl http://localhost:3000/api/v1/chats

## Send a Message via API to any Chat

  To send a message to a chat using the API, make a POST request with the message text to the following endpoint, replacing [Chat_name] with the actual chat name:

    ```bash
    curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "text": "Your message text"
  }' \
  http://127.0.0.1:3000/api/v1/chats/[Chat_name]/messages
