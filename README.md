<p align="center">
<img src="assets/images/lines.svg" width="10%" height="10%"> 
</p>

<div align="center">
	<h1>Data Pipeline 001</h1>
</div>

<p align="center">
<img src="https://img.shields.io/badge/Code Quality-20.10-blue.svg?logo=LOGO&style=flat"> 
<img src="https://img.shields.io/badge/Coverage-2.12-COLOR.svg?logo=LOGO"> 
<img src="https://img.shields.io/badge/Build-Passing-COLOR.svg?logo=LOGO"> 
<img src="https://img.shields.io/badge/Chat-Gitter-COLOR.svg?logo=LOGO"> 
<img src="https://img.shields.io/badge/License-MIT-blue.svg?logo=LOGO">
</p>

<p align="center">
  <a href="#about">About</a> •
  <a href="#installation">Installation</a> •
  <a href="#updating">Updating</a> •
  <a href="#features">Features</a> •
  <a href="#binds">Binds</a> •
  <a href="#wiki">Wiki</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#credits">Credits</a> •
  <a href="#support">Support</a> •
  <a href="#license">License</a>
</p>


## Overview
ACME Inc. is a multinational company operating in the agricultural industry growing and harvesting a variety of commodity grains like wheat, barley, and corn, among others.

As is normally expected from any type of business operation, legal problems are bound to happen, and that is why most companies set up dedicated internal legal department tasked with managing and resolving all these legal issues across the different legal areas: corporate, regulatory, labor and employment, etc. Now, it would be unrealistic for internal legal teams to be able to handle all the potential legal issues across all the practice and regional areas, this is why part of this legal work is normally outsource to external legal firms.

ACME has been keeping track of all the legal cases on their ELM system (Enterprise Legal Management), work outsourced to external legal firms is also tracked there. External vendors are given access to ELM to be able to submit invoices for the work they have performed. These submitted invoices need to be paid by ACME, this is currently a very manual process, but they looking to change that through a series of implementation projects: one of them being the implementation of accounts payable systems in each the three regions they operate in.

ACME has reached out to us to help design and build an integration system to be able to move all the invoice information to the correct accounts payable system so they can be paid automatically to the external legal firms as soon as the invoices have been approved by the internal teams.

The architecture presented here is one of the many potential solutions to this integration problem.

## High-Level Requirements
After meeting with the internal stakeholders (legal and IT) we were able to capture a few interesting requirements:  

* From an integration approach perspective, ACME is managing all other integration via the exchange of flat files, an dthey would like to keep it this way as they already have an on-premises SFTP server in place that they would like to leverage for this integration as well. This SFTP is currently being used for other integrations as well.
* Dedicated database users need to be created for connection purposes on each database, reuse of existing users is not allowed, nor a good practice
* The integration jobs shall run on a daily schedule
* The integration jobs shall check for data completness and consistency, for example:  
```
invoice_total = sub_total - discounts + tax
```
* 



## Architecture
<center>
<img src="assets/diagrams/diagram-1.png" width="100%" height="70%">  
*Fig - A single track trail outside of Albuquerque, New Mexico.*
</center>

<center>
<img src="assets/diagrams/uml_components_diagram.png" width="100%" height="70%">  
*Fig - A single track trail outside of Albuquerque, New Mexico.*
</center>

## Components

### Apache NiFi
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.


### Component 002
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.

<center>
<img src="assets/er.png" width="60%" height="60%">  
*Fig - A single track trail outside of Albuquerque, New Mexico.*
</center>  


### Component 003
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.

## How It All Works
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.


## Getting Started
### Pre-requisites
1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.

```
$ docker-compose down -v
```
```
$ docker-compose down -v
```
### Install
2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.
3. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.
4. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.
5. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.

<center>

| Component         | Link                                           |
|-------------------|------------------------------------------------|
| pgAdmin UI        | [http://127.0.0.1:8091](HTTP://127.0.0.1:8091) |
| NiFi Data Flow UI | [http://127.0.0.1:8091/nifi/](http://127.0.0.1:8091) |
| NiFi Registry UI  | [http://127.0.0.1:8091](HTTP://127.0.0.1:8091) |

</center>

### Uninstall
2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.

```
$ docker-compose down -v
```


## Usage
Use this space to show useful examples of how a project can be used.

## Deployment Approach
The following diagram outlines one of the many approaches we could take to deploy this pipeline in AWS.

A few comments on deployment:

* Review AWS Well Architected Framework

![The San Juan Mountains are beautiful!](assets/gif_1.gif "")  
*Deployment diagram in AWS*   

## Potential Improvements
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. Aenean mollis sapien eget eros semper porta. Maecenas id nisi ultricies, vestibulum magna vel, elementum lectus. Praesent bibendum vitae est ac aliquam.

* Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc.
* Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc.
* Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc.
* Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae risus id leo tincidunt placerat iaculis sit amet nunc. 

## References
Here is a list of references and documentation   

* Docker - [Duck Duck Go](https://duckduckgo.com).
* Docker Compose - [Duck Duck Go](https://duckduckgo.com).
* PostgreSQL - [Duck Duck Go](https://duckduckgo.com).


## License
Distributed under the MIT License. See LICENSE file for more information.

## Contact
Massimo Penzo - penzo.massimo@gmail.com






