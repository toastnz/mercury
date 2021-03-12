# Site Installation
## Frontend Development

### Installation
You will need to run `make install` in your site directory before the build tasks can run.
```bash
cd your/site/dir;
make install;
```
### Tasks
#### dev task
This task will watch for changes of scss or javascript files and compile them as you work.
```bash
make dev;
```
#### build task
Once you have finished development and you are happy with your changes, compile the scss and javascript
```bash
make build;
```
# Before go live
Update the package.json, removing ^ from the dependency version numbers to lock them in the state they are in. This will avoid unwanted and breaking package updates in the future.