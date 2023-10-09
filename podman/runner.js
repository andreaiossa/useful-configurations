'use strict';

module.exports = ({
  spawn,
  COMMAND
}) => {

  const collect = () => {
    const processes = []
    console.log(`Starting process to collect podman machines info`)
    
    const {version, machines, author} = require('./resources/machines.json')
    console.log(`Recovering machines info from json file. author: ${author}, version: ${version}`)

    for (const {
      name,
      cpus,
      memory,
      diskSize
    } of machines) {
      const options = []
      if (cpus != null) {
        options.push(`--cpus ${cpus}`);
      }
      if (memory != null) {
        options.push(`--memory ${memory}`);
      }
      if (cpus != null) {
        options.push(`--disk-size ${diskSize}`);
      }
      if (name != null) {
        options.push(name);
      }

      processes.push({options, name})
    }

    return processes
  }
  
  const prepareProccess = processes => {
    promiseList = [] 

    for (const {options, name} of processes) {
      const promise = new Promise((resolve, reject) => {
        const command = spawn(COMMAND, options, {
          'shell': true
        });

        ls.stderr.on('data', (data) => {
          console.error(`stderr: ${data}`);
          reject()
        });

        command.on('close', exitCode => {
          console.log(`Machine ${name} istantiated correctly`)
          resolve(exitCode)
        })
      })

      promiseList.push(promise)
    }

    return promiseList
  }

  const start = async () => {
    const processes = collect()
    const promiseList = prepareProccess(processes)

    console.log('Starting process to instantiate machines. Launching command.')
    await Promise.all(promiseList)
  }

  return {
    start
  }
}