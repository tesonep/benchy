# Benchy

Hello, I am an electric benchy, I can't go very fast or very far and if you drive me people will think you are awesome.

# Quick Start

I am a framework for doing benchmarks in Pharo. 

Just run the `runAll.sh` script. That will:

1. Download all the pharo images that are defined in the `/images` folder
2. Then it will built the vms defined in the `/vms` folder
3. then it will run the benchmarks defined in the `benchs` folder

Each benchmark defines basically:

- In which images it need to be run
- With which vms
- and what code does the vm needs to evaluate to run the benchmark

One benchmark can be run on several images with several vms. Benchy will take care of that, you only need to specify the configuration.

Benchy will create a csv file with the time of the execution and two log files with the logs that happened during the execution. In your Pharo code you can to `anObj trace` to leave traces.

# Executing your benchmars

The benchmarks that are here by default are made to test the performance of Pharo. If you want to run your own benchmarks you need to:

1. Add a `.sh` file in the `/benchs` folder with the configuration of your benchmark.
2. [Optional] Add a `.sh` file in the `/vms` folder with the instructions to download your vm. If not you can use one of the already present vms.
3. Execute `runBenchs.sh name_of_your_benchmark` with the name.s of your benchmark.s

# Create your own configuration

You can create your own benchmark configuration by creating a `.sh` file using the following template:

```bash
#!/bin/bash

IMAGES="<the images you want your benchmark to run in>"
VMs="<the VMs you want your benchmark to run with>"
PHARO_CMD="<the command you want the VM to execute>"

source "$1/bench.inc"
```

and then add it to the `/benchs` folder.

You can, if you want, add the following lines to run the same command with other images and/or VMs:

```bash
IMAGES="<other images>"
VMs="<other VMs>"

source "$1/bench.inc"
```

Be sure not to forget to rewrite `source "$1/bench.inc"` so that the benchmark reruns with the new images and/or VMs.

# More info

In the `/src` folder there is code to make plots for the benchmarks.