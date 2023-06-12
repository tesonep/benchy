local defaultIterations = 10;
local defaultRuns = 100;
local defaultVMVersion = 10;
local defaultImageVersion = 11;
local defaultTimeout = 100;

# Categorize the benchmarks
local safe = ['SMarkSlopstone'];
local macro = ['SMarkRichards', 'SMarkDeltaBlue', 'SMarkCompiler'];
local networkTests = ['Network.*', 'Zinc.*', 'Zodiac.*'];
local testing = ['Opal.*','AST.*'] + networkTests;
local experimental = ['',''];
local failing = ['',''];
local benchmarks = safe + macro;

# VMs
local vms = ['latest9', 'latest10'];
local experimentalVMs = ['druid','stack','jitZero'];

# Images
local images = ['Pharo11SMark'];
local experimentalImages = ['Pharo11ComposedImage' , 'newImageFormat'];

local bench(benchClass, vm=defaultVMVersion, image=defaultImageVersion) = {
    name: 'bench_%(benchClass)s_vm=%(vm)s_image=%(image)s' % { benchClass: benchClass, vm: vm, image: image },
    image: 'pharo11',
    commands: [
      'run.sh %(benchClass)s --vm=%(vm)s' % { benchClass: benchClass, vm: vm } ]
};

{
    environments: [
            {
                name: vm,
                configuration: [
                    '%s %s' % [bench, vm]
                    for bench in benchmarks
                ]
            }
            for vm in vms
    ],
}