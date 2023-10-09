'use strict';

const {spawn} = require('child_process')
const runnerModule = require('./runner')
const COMMAND = 'podman machine init'

(async () => {
  const runner = runnerModule({
    spawn,
    COMMAND
  })

  await runner.start()
})