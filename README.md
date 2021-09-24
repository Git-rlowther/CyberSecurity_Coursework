# CyberSecurity_Coursework
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/Git-rlowther/CyberSecurity_Coursework/blob/main/Diagrams/Network_Diagram.png "Network Diagram")

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. 

  - [docker_vms.yml](https://github.com/Git-rlowther/CyberSecurity_Coursework/blob/main/Ansible/docker_vms.yml)
  - [Elk_Playbook.yml](https://github.com/Git-rlowther/CyberSecurity_Coursework/blob/main/Ansible/Elk_playbook.yml)
  - [filebeat_webservers.yml](https://github.com/Git-rlowther/CyberSecurity_Coursework/blob/main/Ansible/filebeat_webservers.yml)
  - [metricbeat_webservers.yml](https://github.com/Git-rlowther/CyberSecurity_Coursework/blob/main/Ansible/metricbeat_webservers.yml)

This document contains the following details:

- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

- Load balancers protect the Availability of the attached resources. A jump box allows for a secure connection to other network resources from a single point. This limits the attack avenues that malicious actors can utilize to attempt to gain entry to the environment.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.

- Filebeat watches for log files, then collects log events, and forwards them to Elasticsearch or Logstash for indexing.
- Metricbeat records the metrics and statistics from the operating system and services running on the server. These metrics can include information on CPU usage, Docker container information, or running services like Apache. 

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                 | Function             | IP Address | Operating System     |
| -------------------- | -------------------- | ---------- | -------------------- |
| Jump-Box-Provisioner | Gateway              | 10.0.0.4   | Linux (ubuntu 20.04) |
| ELK-P1               | Elk stack monitoring | 10.1.0.4   | Linux (ubuntu 20.04) |
| Web-1                | DVWA web server      | 10.0.0.9   | Linux (ubuntu 20.04) |
| Web-2                | DVWA web server      | 10.0.0.10  | Linux (ubuntu 20.04) |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the __ELK-P1__ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

- **My local host's public IP address which will not be posted here**

Machines within the network can only be accessed by ssh from Jump-Box-Provisioner- Ansible Docker container

- Jump-Box-Provisioner, 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses           | Additional Security                 |
| -------------------- | ------------------- | ------------------------------ | ----------------------------------- |
| Jump-Box-Provisioner | Yes- SSH only       | Local host's public IP address | SSH key pair - local host           |
| ELK-P1               | Yes                 | Local host's public IP address | SSH key pair from ansible container |
| Web-1                | No                  | 10.0.0.4                       | SSH key pair from ansible container |
| Web-2                | No                  | 10.0.0.4                       | SSH key pair from ansible container |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

- ...using Infrastructure as Code allows for all machines to be configured the same. This is a consistent and efficient way to configure machines.

The playbook implements the following tasks:

- Install docker.io - This downloads the docker deb package
- Install python3-pip - This downloads and installs python3 pip module
- Install Docker module - This uses the newly installed python3-pip module to install the Docker module
- Use command module - This increases the virtual memory used on the ELK Stack VM
- Use sysctl module - This sets the value of the virtual memory to persist through restarts
- Use docker_container_module - This downloads and installs a docker ELK container
- Use systemd module - This sets the docker ELK container to start after a restart of the VM

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](https://github.com/Git-rlowther/CyberSecurity_Coursework/blob/main/Images/docker_ps_output.png "Docker PS Output")

### Target Machines & Beats

This ELK server is configured to monitor the following machines:

- 10.0.0.9
- 10.0.0.10

We have installed the following Beats on these machines:

- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:

- Filebeat collects event data from log files, connection log files as an example, using inputs and harvesters. These harvesters collect the data from the log file and send it to the specified output. As an example for Web Traffic logs, we can expect to see events like Get requests and Responses, including response codes like 404 and 200. 
- Metricbeat collects infrastructure metrics and statistics from the operating system (like CPU utilization and RAM) and services like MySQL and Apache. As an example, we can expect to see memory usage for each machine that Metricbeats is monitoring. 

### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the Elk_playbook.yml file to /etc/ansible/
- Update the **hosts** file to include the IP addresses of the target machine(s)
- Run the playbook, and navigate to "http://{**Your ELK stack public IP**}:5601/app/kibana" to check that the installation worked as expected.

 **Bonus** provide the specific commands the user will need to run to download the playbook, update the files, etc.

- To download the playbook run:  curl https://github.com/Git-rlowther/CyberSecurity_Coursework/blob/main/Ansible/Elk_playbook.yml --output elk_playbook.yml
- To run the playbook run: ansible-playbook elk_playbook.yml
