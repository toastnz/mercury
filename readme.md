# Mercury build process

## Frontend Development

### Node Version
The current node version is set through ddev and is currently ```version 22```.

### Installation
This site uses ddev & vite to run locally with HMR for styles (and scripts if using react)
```bash
ddev config
```
---

### Tasks

#### watch task
This task will watch for changes of scss or javascript files and compile them as you work. NB: the ddev server must be running 
```bash
ddev exec npm run dev
```
#### Build task
Before you deploy this site to a server, you must run a build task to reflect those changes. 
```bash
ddev exec npm run build
```
---