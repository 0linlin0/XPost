# What it does

A post-exploitation tool tailored for high-value systems, designed to assist in real attack penetration, achieving more comprehensive, covert, and long-term post-exploitation information gathering, as well as lateral movement penetration.

# User

Red team attack and defense personnel.

# Application-oriented

email servers, gateway devices, documents, enterprise knowledge management and collaboration platforms, single sign-on platforms, defect tracking platforms, IT operations management software, domain management team building, code repository management, etc.

# What the capabilitie

Including but not limited to：email retrieval, plaintext password recording, operations data acquisition, obtaining arbitrary login credentials under unknown passwords, domain controller information retrieval, single sign-on hijacking, and trace cleaning operations.

# Advantages

The data callback traffic achieves traffic concealment
stealth persistence, fileless landing
after server rebooting or patch updates, the backdoor remains undetectable.

# Currently Supported Applications

zimbra、confluence、zoho

# Usage Methods and Scenarios

1.The tool relies on the Godzilla Webshell management tool, deployed in the form of plugins. Godzilla download link: https://github.com/BeichenDream/Godzilla

2.After successfully obtaining access to the target system, in most scenarios, permissions are gained through remote attacks exploiting vulnerabilities. It's also possible to gain access to target permissions through other means. Regardless of the method, we need an environment where code can be executed. We implant a memory-based webshell successfully into the memory and use the webshell as a loader to further execute functions (payloads) present in other tools in memory, obtaining the desired data and performing other operations.
When the vulnerability itself supports code execution, such as the confluenceCVE-2023-22527 template injection vulnerability, we directly inject a memory-based webshell by optimizing the exploit.
When the vulnerability type involves file upload or command execution, refer to the following methods for injecting a memory-based webshell.

# Core Overview of Functional Implementation Technologies

The topic discussed the post-exploitation research on high-value systems such as email servers, gateway devices, documents, enterprise knowledge management and collaboration platforms, single sign-on platforms, defect tracking platforms, IT operations management software, domain management team building, code repository management, etc.Targeting various applications, it was achieved by deploying highly covert plugins and leveraging deprecated functionalities to hijack the runtime web container request processing logic and implant highly concealed persistent backdoors in memory. These memory-implanted backdoors serve as loaders to execute effective payloads directly in memory, with both the backdoor code logic and functional payloads operating within memory.
In-depth analysis of the code logic for different applications led to the exploration of solutions for challenges encountered during the runtime execution of payloads in memory. These challenges included multiple class loader loading, bypassing system file verification protection, and context decoupling for functional code extraction, among other issues.
The implementation enabled the execution of effective payloads in memory without initiating additional network requests to the target or writing files to disk. This allowed for the covert execution of payloads in memory under highly concealed attack scenarios, facilitating the extraction of high-value system information, such as email retrieval, plaintext password recording, operations data acquisition, obtaining arbitrary login credentials under unknown passwords, domain controller information retrieval, single sign-on hijacking, and trace cleaning operations.
Subsequently, existing web shell management tools were utilized to encrypt and transmit data, achieving traffic-side concealment. This approach aims to achieve a more comprehensive, covert, and long-term post-exploitation information gathering and deep penetration in real-world attack scenarios.

## Zimbra

**1. Upload the 'injec.jsp' file to the target system's** 

upload directory : /opt/zimbra/jetty\_base/webapps/zimbra/public/

**2.Access 'inject.jsp' to inject a memory backdoor into the system. After injecting, delete 'inject.jsp,' but the backdoor will still persist.**

![图片](./images/1.png)

Successfully removed 'inject.jsp' and established a connection to the memory backdoor.

![图片](./images/22.png)

**3.Backdoor Persistence**

Prevent the memory-resident backdoor from being cleared upon restart by replacing the zimbra-license.jar plugin. Substitute the malicious zimbra-license-success.jar for the original system jar file to achieve backdoor persistence.

![图片](./images/3.png)

**4.Clearing logs**

Utilize the 'zimbraplugin ClearLog' function to erase logs of malicious JSP access.

![图片](./images/4.png)

**5.Functional payload**

Utilize specific functionalities as needed. Upon clicking the corresponding function, the payload will be sent to the server backdoor, and the corresponding payload will be executed in memory.

![图片](./images/5.png)

**6.Traffic**

![图片](./images/6.png)

**7.Test Version**

9\.0.0\_GA\_4583

## Zoho

**1.Upload shell.jar to inject a backdoor into the target system at runtime**

![图片](./images/7.png)

The backdoor has been successfully injected; delete shell.jar.

**2.Backdoor Persistence**

To prevent the loss of the backdoor upon system restart, modify the startup logic by replacing AdventnetADSMStartUp.jar.

**3.Functional payload**

![图片](./images/8.png)

**4.Traffic**

![图片](./images/9.png)

**5.Test Version**

ManageEngine\_ADManager\_Plus\_7222\_64

## Confluence

**1. Upload inject.jsp to inject a memory backdoor.**

Upload path: /opt/atlassian/confluence/synchrony-proxy/

**2.Access inject.jsp to inject a memory backdoor.**

![图片](./images/10.png)

After successfully injecting the backdoor, delete inject.jsp.

**3.Functional payload**

![图片](./images/11.png)

**4.Traffic**

![图片](./images/12.png)

**5.Test Version**

![图片](./images/13.png)
