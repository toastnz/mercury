# Site Installation
## Frontend Development
### Node Version
Make sure you are on the correct node version
```bash
sudo n 16
```
### Installation
You will need to run `yarn` in your site directory before the build tasks can run.
```bash
cd your/site/dir;
yarn;
```
### Tasks
#### watch task
This task will watch for changes of scss or javascript files and compile them as you work.
```bash
yarn run watch;
```
#### build task
Once you have finished development and you are happy with your changes, compile the scss and javascript
```bash
yarn run build;
```
# Before go live
Update the package.json, removing ^ from the dependency version numbers to lock them in the state they are in. This will avoid unwanted and breaking package updates in the future.