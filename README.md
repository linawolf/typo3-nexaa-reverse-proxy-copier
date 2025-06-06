# Configure TYPO3 Reverse Proxy for nexaa.io

This container image is a lightweight, one-shot utility to help configure TYPO3 for use behind a reverse proxy  
— specifically for deployments on [nexaa.io](https://nexaa.io).

It generates and installs a customized `additional.php` file into your mounted TYPO3 configuration directory,  
typically at `typo3conf/system/` for classic installations or `config/system/` for Composer-based setups.

---

## 🚀 How to Use

### 🧪 Locally (for testing)

```bash
docker run --rm \
  -v $(pwd)/typo3conf:/config \
  -e CIDR_RANGE="10.0.0.0/8" \
  linawolf/typo3-nexaa-reverse-proxy-copier:latest
```

### Using TYPO3 Reverse Proxy Config Image on Nexaa.io

This guide explains how to use the `linawolf/typo3-nexaa-reverse-proxy-copier:latest` container image on [nexaa.io](https://nexaa.io) to set up TYPO3 reverse proxy configuration.

---

#### 🔧 Step-by-Step Setup

1. **Log into Nexaa.io** and go to your project.
2. Create a new [Container Job](https://support.tilaa.com/hc/en-us/articles/25219712498194-Container-Jobs).
3. Set the **Application container image** to:

   ```
   linawolf/typo3-nexaa-reverse-proxy-copier:latest
   ```

4. Set **Use credentials from registry** to:

   ```
   Public
   ```

5. Under **Add environment variables**, set:

   | Variable     | Value          |
   |--------------|----------------|
   | `CIDR_RANGE` | `10.0.0.0/10`  |

6. Under **Add persistent storage to your container**, map your TYPO3 config directory to `/config`:

    - **Host path or volume**:
        - `/var/www/html/typo3conf` (classic installs), or
        - `/var/www/html/config` (Composer-based installs)

    - **Container path**:
      ```
      /config
      ```

7. Set a **Schedule**:
    - For one-time setup, schedule it to run once.
    - Or run periodically (it will overwrite the file each time).

---

##### 📝 What This Does

This container will:

- Generate an `additional.php` file inside `/config/system/`
- Inject the value from `CIDR_RANGE` into the configuration
- Enable TYPO3’s reverse proxy support with your custom CIDR

Resulting config example:

```php
<?php

$GLOBALS['TYPO3_CONF_VARS']['SYS']['reverseProxyIP'] = '10.0.0.0/10';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['reverseProxy'] = true;
$GLOBALS['TYPO3_CONF_VARS']['SYS']['reverseProxyHeaderMultiValue'] = 'first';
```

---

##### ⚠️ Notes

- `CIDR_RANGE` is required or the container will fail to run.
- This image is intended for **testing or early deployment**.
- The config file will be **overwritten every time the container runs**.

---

## 🔗 Image on Docker Hub

You can find the image at:  
[https://hub.docker.com/r/linawolf/typo3-nexaa-reverse-proxy-copier](https://hub.docker.com/r/linawolf/typo3-nexaa-reverse-proxy-copier)


## ✏️ License

This project is licensed under the [GNU General Public License v2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html), 
consistent with the TYPO3 project's licensing.

