# Slack Tipbot

#### Tipbot for [Slack](https://slack.com)

## Setup

We're using [digitalocean.com](https://digitalocean.com) so these instructions will be specific to that plaform.

### Create and configure droplet

#### Create droplet 

* Go to digitalocean.com and create a new droplet
  * hostname: CoinTipper
  * Size
    * I usually go w/ 2GB/2CPUs $20 month
  * Region
    * San Francisco
  * Linux Distributions
    * Ubuntu 16.04 x64
  * Add SSH keys

#### Configure hostname

* Copy/Paste IP address into URL bar
  * Put in `hostname`
    * `example.com`
  * Check `Use virtualhost naming for apps
    * `http://<app-name>.example.com`
  * Finish Setup

#### Add DNS

* You'll need a domain for this. For this documentation I'm using `example.com`
* Point your domain's nameservers to digitalocean
  * `ns1.digitalocean.com`
  * `ns2.digitalocean.com`
  * `ns3.digitalocean.com`
* In digitalocean's `DNS` section set an `A-Record` for your `hostname` from your previous step
  * Make the `hostname` be the name of your app
    * `dptip`
  * Make the IP address be the one provided by digitalocean for your droplet.
  * `ping foocointipper.example.com`
    * `PING dptip.example.com (143.143.243.143): 56 data bytes`

#### SSH into your new virualized box

* `ssh root@ip.address.of.virutalized.box`
  * If you correctly added your SSH keys you'll get signed in
  * Remove root login w/ password
    * `sudo nano /etc/ssh/sshd_config`
      * `PermitRootLogin without-password`

#### Compile your coin

Instructions can be found on the [DigitalPrice](http://digitalprice.org/) website.

* Configure the daemon by adding the following to your config file
  * `daemon=1`
  * `staking=0`
  * `enableaccounts=1`
  * `rpcport=56661`
  * `rpcthreads=100`
  * `irc=0`
  * `dnsseed=1`

#### Clone the CoinTipper Bot git repo

* `git clone https://github.com/majordutch/slack_tipbot.git`

#### Set up the Slack integration: as an "outgoing webhook" 

* https://yoursite.slack.com/services/new/outgoing-webhook
* Write down the api token they show you in this page
* Set the trigger word. For the DigitalPrice example above we use `dptipper`
* Set the Url to the server you'll be deploying on http://example.com:4567/tip

#### Give your bot some attitude!

* Copy `coin_config/digitalprice.rb` to a file in `coin_config/` and name it after your coin. 
* Open your newly copied file and change the name of the `module` to the same name as your coin. 
* This file contains all the snippets of text, emojis, and variables needed to customize your bot's behavior and attitude 

#### Launch the server!

* `RPC_USER=rpcuser RPC_PASSWORD=rpcpassword SLACK_API_TOKEN=apikey COIN=digitalprice bundle exec ruby tipper.rb -p 4567`
  
## Commands

* Tip - send someone coins

  `dptipper tip @somebody 100`

* Deposit - put coin in

  `dptipper deposit`

* Withdraw - take coin out

  `dptipper withdraw UgTt2AAWeMYKT9yAE7iEn1YsZ9hQXLhLYh 100`

* Balance - find out how much is in your wallet

  `dptipper balance`

## Security

This runs an unencrypted hot wallet on your server. You should not store significant amounts of cryptocoins in this wallet. Withdraw your tips to an offline wallet often. 

## Credits

This project was originally forked from [dogetip-slack](https://github.com/tenforwardconsulting/dogetip-slack) by [tenforwardconsulting](https://github.com/tenforwardconsulting)

## Support

Like what you see or using this with your team? You can support [the developer](https://github.com/cgcardona) with bitcoin at `1Jwdn9NjhPHkUiEg4gHNaTrYe6s9RkXTs1`

Further the developer is a founding member of the [Blockchain Technology Group](http://blocktech.co) that currently is developing open-source software, hardware and altcoins in the crypto-currency space.  If you would like to support BlockTech, you may donate at `1PYNQ3iUSRrzJjEB2FniGruLaz11vMuPmo`.
