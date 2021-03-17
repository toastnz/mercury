# Site Installation
## Frontend Development

### Initial Installation
You will need to run `make init` in your site directory.
This will install your choice of selected theme, and run a composer install.
This will also generate a .env file for you :)
```bash
cd your/site/dir;
make init;
```

### Frontend Tasks
#### Install task
This task will install all of your package.json packages
```bash
make install;
```
#### Dev task
This task will watch for changes of scss or javascript files and compile them as you work.
```bash
make dev;
```
#### Build task
Once you have finished development and you are happy with your changes, compile the scss and javascript
```bash
make build;
```
# Before go live
Update the package.json, removing ^ from the dependency version numbers to lock them in the state they are in. This will avoid unwanted and breaking package updates in the future.