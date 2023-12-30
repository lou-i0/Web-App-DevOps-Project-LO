# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date. 
as of 24/12/2023, a new feature has been added for delivery date. However, this has been removed for now ready for future releases. 
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## **Containerisation** 

This application employs the use of Docker, to provde a container to move the application from one to another, regardless of operation system or platform. In order to recreate what was done to acheive this , the following was commited:
1. Created a Dockerfile and with the required configuration against the application to hold and move. this includes stating to use:
    - Using python3.8 as the base image for docker to use
    - Copy all contents of the application into docker under a dicrectory as "/app".
    - Ensure both the app.py python file and the requirements file ( contains the dependant python libraries needed) are specified in the /app folder in docker.
    - Run a set of command to use the debain linux OS as well as initalise the ODBC connection.
    - Run pip install to get the updatetools library 
    - Run pip install to get the libraries based on the requirements.txt text file. 
    - Ensure that port 5000 is used to be able to access the application created. 
    - Set the entrypoint to be python3 so docker recoginises the application to run from this environment. 
    - Finally - upon running the docker build -  to launch the application. 

2. Executed following command in command prompt to containerise the application: docker build -t aic-app:latest .
3. Then, the following command in command prompt to test the build using : docker run -p 5000:5000 aic-app  

## Infrastructure as code (IAC)
This project utilises the use of Terraform to deplpy the containerised application onto a Azure Kubernetes Cluster to ensure application stability.

### Networking 
a module has been created to set up the rources needed to be deployed into Azure:
- A resource Group - named aic-app-ntw-lo where all other components will be housed under.
- A Virtual Network (Vnet) where the application and Kubernetes cluster will run from,
- Control and work subnets within the Vnet.
- A Network Security Group to manage access to and from this application with rules on ssh and the lkubeapi server.
- input variables include resource group name, cloud location, and vnet adress space.
- out variables include vnet id, control and worker node id's, netwokring resoure group name, and networking security group id.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))
- [Louis Othen]([https://github.com/lou-i0/Web-App-DevOps-Project-LO])

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
