# Configure TYPO3 Reverse Proxy for nexaa.io

This container image is a lightweight, one-shot utility to help configure TYPO3 for use behind a reverse proxy 
— specifically for deployments on [nexaa.io](https://nexaa.io).

It copies an `additional.php` configuration file into your mounted TYPO3 configuration directory, 
typically at `typo3conf/system/` for classic installations or `config/system/` for Composer-based installations.

---

## 🚀 How to Use

### Locally (for testing):

```bash
docker run --rm -v $(pwd)/typo3conf:/config your-dockerhub-username/typo3-init-copy:latest
```

## ✏️ License

This project is licensed under the [GNU General Public License v2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html), 
consistent with the TYPO3 project's licensing.

