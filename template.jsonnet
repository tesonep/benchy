local default_benchmarks = ["DeltaBlue", "Richards", "Slopstones","Compiler"];
local provisioning_benchmarks = ["Network"];
 
function(runs=100, iterations=30, pharo_image_version=11, pharo_vm_version=10) {
    runs: runs,
	iterations: iterations,
	pharo_image_version: pharo_image_version,
    pharo_vm_version: pharo_vm_version
    // Sidenote: the fields are hidden here, because they use ::,
    // use : to make them appear when the object is manifested.
    // Sidenote 2: You can provide default argument values. 
    // For example function(name, port=8080) makes port optional.
}

{
    "Performance": [
    {
        "name": "Performance Safe Benchmarks",
        "benchmarks": default_benchmarks,
        "description": "Run default safe configuration: This should finish safely"
    },
      {
        "name": "Performance Experimental Benchmarks",
        "benchmarks": default_benchmarks,
        "description": "Run default safe configuration: This should finish safely"
    },
    ],
    "Provisioning": [
    {
        "name": "Measure provisioning time",
        "benchmarks": provisioning_benchmarks,
        "description": "To measure if VM and image are correctly downloaded and launched"
    },
    ],
}