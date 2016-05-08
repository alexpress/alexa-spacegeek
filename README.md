# Alexa SpaceGeek Sample Application for `alexpress`

This is a port of the SpaceGeek application from Amazon's Alexa Skill Kit to the `alexpress` API using AWS Lambda.

## How to Use

### Clone via github

```shell
git clone https://github.com/alexpress/alexa-spacegeek
```

### Install with npm

Install dependencies with npm (including dev):

```shell
npm install

#for tests and deployment
npm install -g mocha grunt-cli coffee-script
```

### Lambda Info

Create a file `.aws.json` in the project root with your lambda's `arn`:

```json
{
  "lambda": {
    "arn": "arn:aws:lambda:us-east-1:[your arn details]"
  }
}
```

### Test

To run tests:

```shell
mocha
```

### Deploy to AWS Lambda

Ensure that your `arn` information is set as described above.

```shell
grunt deploy
```

### Hooking up to an Alexa Skill 

Follow the standard procedure to create a new skill and point it to your lambda `arn`. Intent and sample utterances can be found in the `assets` directory.





