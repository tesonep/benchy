Class {
	#name : #BenchyTestCase,
	#superclass : #TestCase,
	#instVars : [
		'benchyHistory'
	],
	#category : #'Benchy-Tests'
}

{ #category : #accessing }
BenchyTestCase >> benchyHistory [

	^ benchyHistory
]

{ #category : #accessing }
BenchyTestCase >> benchyHistory: anObject [

	benchyHistory := anObject
]

{ #category : #running }
BenchyTestCase >> sampleBenchmarksComplete [

	^ '#datatype measurement,tag,double:.,tag,tag,tag,tag,tag,dateTime:RFC3339
benchmark,status,duration,req_iterations,image_name,vm_name,output_file,err_file,time
slopstone,OK,3.534,1,Pharo11SMark,latest9,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-02.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-02.stderr,2023-08-02T16:41:59Z
slopstone,OK,3.692,1,Pharo11SMark,latest10,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-02.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-02.stderr,2023-08-02T16:42:03Z
slopstone,ERROR,0.001,1,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-02.stdout,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-02.stderr,2023-08-02T16:42:03Z
slopstone,OK,3.494,1,Pharo11SMark,latest9,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:24:05Z
slopstone,OK,3.697,1,Pharo11SMark,latest10,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:24:09Z
slopstone,ERROR,0.001,1,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:24:09Z
slopstone,OK,3.513,3,Pharo11SMark,latest9,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:24:32Z
slopstone,OK,3.505,3,Pharo11SMark,latest9,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:24:36Z
slopstone,OK,3.462,3,Pharo11SMark,latest9,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:24:39Z
slopstone,OK,3.660,3,Pharo11SMark,latest10,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:24:43Z
slopstone,OK,3.697,3,Pharo11SMark,latest10,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:24:47Z
slopstone,OK,3.739,3,Pharo11SMark,latest10,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:24:51Z
slopstone,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:24:51Z
slopstone,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:24:51Z
slopstone,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:24:51Z
network,OK,30.175,3,Pharo10,latest9,/benchy/_build/results/network-Pharo10-latest9/network-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/network-Pharo10-latest9/network-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:25:21Z
network,OK,28.773,3,Pharo10,latest9,/benchy/_build/results/network-Pharo10-latest9/network-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/network-Pharo10-latest9/network-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:25:49Z
network,OK,29.634,3,Pharo10,latest9,/benchy/_build/results/network-Pharo10-latest9/network-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/network-Pharo10-latest9/network-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:26:19Z
network,OK,29.478,3,Pharo10,latest10,/benchy/_build/results/network-Pharo10-latest10/network-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/network-Pharo10-latest10/network-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:26:49Z
network,OK,28.696,3,Pharo10,latest10,/benchy/_build/results/network-Pharo10-latest10/network-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/network-Pharo10-latest10/network-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:27:17Z
network,OK,38.927,3,Pharo10,latest10,/benchy/_build/results/network-Pharo10-latest10/network-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/network-Pharo10-latest10/network-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:27:56Z
network,OK,28.704,3,Pharo11,latest9,/benchy/_build/results/network-Pharo11-latest9/network-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/network-Pharo11-latest9/network-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:28:25Z
network,OK,27.783,3,Pharo11,latest9,/benchy/_build/results/network-Pharo11-latest9/network-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/network-Pharo11-latest9/network-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:28:53Z
network,OK,27.737,3,Pharo11,latest9,/benchy/_build/results/network-Pharo11-latest9/network-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/network-Pharo11-latest9/network-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:29:20Z
network,OK,28.638,3,Pharo11,latest10,/benchy/_build/results/network-Pharo11-latest10/network-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/network-Pharo11-latest10/network-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:29:49Z
network,OK,33.063,3,Pharo11,latest10,/benchy/_build/results/network-Pharo11-latest10/network-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/network-Pharo11-latest10/network-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:30:22Z
network,OK,28.348,3,Pharo11,latest10,/benchy/_build/results/network-Pharo11-latest10/network-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/network-Pharo11-latest10/network-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:30:51Z
network,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/network-Pharo11ComposedImage-newImageFormat/network-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/network-Pharo11ComposedImage-newImageFormat/network-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:30:51Z
network,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/network-Pharo11ComposedImage-newImageFormat/network-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/network-Pharo11ComposedImage-newImageFormat/network-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:30:51Z
network,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/network-Pharo11ComposedImage-newImageFormat/network-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/network-Pharo11ComposedImage-newImageFormat/network-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:30:51Z
opalTests,OK,3.817,3,Pharo10,latest9,/benchy/_build/results/opalTests-Pharo10-latest9/opalTests-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo10-latest9/opalTests-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:30:54Z
opalTests,OK,3.856,3,Pharo10,latest9,/benchy/_build/results/opalTests-Pharo10-latest9/opalTests-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo10-latest9/opalTests-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:30:58Z
opalTests,OK,4.362,3,Pharo10,latest9,/benchy/_build/results/opalTests-Pharo10-latest9/opalTests-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo10-latest9/opalTests-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:31:03Z
opalTests,OK,4.063,3,Pharo10,latest10,/benchy/_build/results/opalTests-Pharo10-latest10/opalTests-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo10-latest10/opalTests-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:31:07Z
opalTests,OK,4.253,3,Pharo10,latest10,/benchy/_build/results/opalTests-Pharo10-latest10/opalTests-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo10-latest10/opalTests-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:31:11Z
opalTests,OK,4.727,3,Pharo10,latest10,/benchy/_build/results/opalTests-Pharo10-latest10/opalTests-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo10-latest10/opalTests-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:31:16Z
opalTests,OK,6.724,3,Pharo11,latest9,/benchy/_build/results/opalTests-Pharo11-latest9/opalTests-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo11-latest9/opalTests-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:31:22Z
opalTests,OK,6.815,3,Pharo11,latest9,/benchy/_build/results/opalTests-Pharo11-latest9/opalTests-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo11-latest9/opalTests-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:31:29Z
opalTests,OK,6.970,3,Pharo11,latest9,/benchy/_build/results/opalTests-Pharo11-latest9/opalTests-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo11-latest9/opalTests-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:31:36Z
opalTests,OK,6.560,3,Pharo11,latest10,/benchy/_build/results/opalTests-Pharo11-latest10/opalTests-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo11-latest10/opalTests-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:31:43Z
opalTests,OK,6.916,3,Pharo11,latest10,/benchy/_build/results/opalTests-Pharo11-latest10/opalTests-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo11-latest10/opalTests-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:31:50Z
opalTests,OK,6.928,3,Pharo11,latest10,/benchy/_build/results/opalTests-Pharo11-latest10/opalTests-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo11-latest10/opalTests-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:31:57Z
opalTests,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/opalTests-Pharo11ComposedImage-newImageFormat/opalTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo11ComposedImage-newImageFormat/opalTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:31:57Z
opalTests,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/opalTests-Pharo11ComposedImage-newImageFormat/opalTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo11ComposedImage-newImageFormat/opalTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:31:57Z
opalTests,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/opalTests-Pharo11ComposedImage-newImageFormat/opalTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/opalTests-Pharo11ComposedImage-newImageFormat/opalTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:31:57Z
smarkCompiler,OK,5.457,3,Pharo11SMark,latest9,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest9/smarkCompiler-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest9/smarkCompiler-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:32:02Z
smarkCompiler,OK,5.461,3,Pharo11SMark,latest9,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest9/smarkCompiler-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest9/smarkCompiler-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:32:08Z
smarkCompiler,OK,5.475,3,Pharo11SMark,latest9,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest9/smarkCompiler-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest9/smarkCompiler-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:32:13Z
smarkCompiler,OK,5.624,3,Pharo11SMark,latest10,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest10/smarkCompiler-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest10/smarkCompiler-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:32:19Z
smarkCompiler,OK,5.649,3,Pharo11SMark,latest10,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest10/smarkCompiler-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest10/smarkCompiler-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:32:24Z
smarkCompiler,OK,5.620,3,Pharo11SMark,latest10,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest10/smarkCompiler-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest10/smarkCompiler-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:32:30Z
smarkCompiler,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:32:30Z
smarkCompiler,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:32:30Z
smarkCompiler,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:32:30Z
kernelTests,OK,13.774,3,Pharo10,latest9,/benchy/_build/results/kernelTests-Pharo10-latest9/kernelTests-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo10-latest9/kernelTests-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:32:44Z
kernelTests,OK,11.073,3,Pharo10,latest9,/benchy/_build/results/kernelTests-Pharo10-latest9/kernelTests-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo10-latest9/kernelTests-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:32:55Z
kernelTests,OK,10.752,3,Pharo10,latest9,/benchy/_build/results/kernelTests-Pharo10-latest9/kernelTests-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo10-latest9/kernelTests-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:33:06Z
kernelTests,OK,11.417,3,Pharo10,latest10,/benchy/_build/results/kernelTests-Pharo10-latest10/kernelTests-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo10-latest10/kernelTests-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:33:17Z
kernelTests,OK,11.488,3,Pharo10,latest10,/benchy/_build/results/kernelTests-Pharo10-latest10/kernelTests-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo10-latest10/kernelTests-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:33:29Z
kernelTests,OK,11.521,3,Pharo10,latest10,/benchy/_build/results/kernelTests-Pharo10-latest10/kernelTests-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo10-latest10/kernelTests-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:33:40Z
kernelTests,ERROR,9.876,3,Pharo11,latest9,/benchy/_build/results/kernelTests-Pharo11-latest9/kernelTests-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo11-latest9/kernelTests-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:33:50Z
kernelTests,ERROR,9.871,3,Pharo11,latest9,/benchy/_build/results/kernelTests-Pharo11-latest9/kernelTests-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo11-latest9/kernelTests-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:34:00Z
kernelTests,ERROR,4.569,3,Pharo11,latest9,/benchy/_build/results/kernelTests-Pharo11-latest9/kernelTests-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo11-latest9/kernelTests-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:34:04Z
kernelTests,OK,11.626,3,Pharo11,latest10,/benchy/_build/results/kernelTests-Pharo11-latest10/kernelTests-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo11-latest10/kernelTests-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:34:16Z
kernelTests,OK,11.554,3,Pharo11,latest10,/benchy/_build/results/kernelTests-Pharo11-latest10/kernelTests-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo11-latest10/kernelTests-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:34:28Z
kernelTests,OK,11.754,3,Pharo11,latest10,/benchy/_build/results/kernelTests-Pharo11-latest10/kernelTests-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo11-latest10/kernelTests-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:34:39Z
kernelTests,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/kernelTests-Pharo11ComposedImage-newImageFormat/kernelTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo11ComposedImage-newImageFormat/kernelTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:34:39Z
kernelTests,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/kernelTests-Pharo11ComposedImage-newImageFormat/kernelTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo11ComposedImage-newImageFormat/kernelTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:34:39Z
kernelTests,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/kernelTests-Pharo11ComposedImage-newImageFormat/kernelTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/kernelTests-Pharo11ComposedImage-newImageFormat/kernelTests-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:34:39Z
richards,OK,4.238,3,Pharo11SMark,latest9,/benchy/_build/results/richards-Pharo11SMark-latest9/richards-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/richards-Pharo11SMark-latest9/richards-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:34:44Z
richards,OK,4.193,3,Pharo11SMark,latest9,/benchy/_build/results/richards-Pharo11SMark-latest9/richards-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/richards-Pharo11SMark-latest9/richards-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:34:48Z
richards,OK,4.208,3,Pharo11SMark,latest9,/benchy/_build/results/richards-Pharo11SMark-latest9/richards-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/richards-Pharo11SMark-latest9/richards-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:34:52Z
richards,OK,4.405,3,Pharo11SMark,latest10,/benchy/_build/results/richards-Pharo11SMark-latest10/richards-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/richards-Pharo11SMark-latest10/richards-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:34:57Z
richards,OK,4.403,3,Pharo11SMark,latest10,/benchy/_build/results/richards-Pharo11SMark-latest10/richards-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/richards-Pharo11SMark-latest10/richards-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:35:01Z
richards,OK,4.409,3,Pharo11SMark,latest10,/benchy/_build/results/richards-Pharo11SMark-latest10/richards-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/richards-Pharo11SMark-latest10/richards-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:35:05Z
richards,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/richards-Pharo11ComposedImageSMark-newImageFormat/richards-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/richards-Pharo11ComposedImageSMark-newImageFormat/richards-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:35:05Z
richards,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/richards-Pharo11ComposedImageSMark-newImageFormat/richards-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/richards-Pharo11ComposedImageSMark-newImageFormat/richards-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:35:05Z
richards,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/richards-Pharo11ComposedImageSMark-newImageFormat/richards-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/richards-Pharo11ComposedImageSMark-newImageFormat/richards-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:35:05Z
files,OK,7.427,3,Pharo10,latest9,/benchy/_build/results/files-Pharo10-latest9/files-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/files-Pharo10-latest9/files-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:35:13Z
files,OK,7.271,3,Pharo10,latest9,/benchy/_build/results/files-Pharo10-latest9/files-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/files-Pharo10-latest9/files-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:35:20Z
files,OK,7.237,3,Pharo10,latest9,/benchy/_build/results/files-Pharo10-latest9/files-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/files-Pharo10-latest9/files-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:35:27Z
files,OK,7.440,3,Pharo10,latest10,/benchy/_build/results/files-Pharo10-latest10/files-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/files-Pharo10-latest10/files-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:35:35Z
files,OK,7.372,3,Pharo10,latest10,/benchy/_build/results/files-Pharo10-latest10/files-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/files-Pharo10-latest10/files-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:35:42Z
files,OK,7.407,3,Pharo10,latest10,/benchy/_build/results/files-Pharo10-latest10/files-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/files-Pharo10-latest10/files-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:35:50Z
files,OK,7.632,3,Pharo11,latest9,/benchy/_build/results/files-Pharo11-latest9/files-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/files-Pharo11-latest9/files-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:35:57Z
files,OK,7.653,3,Pharo11,latest9,/benchy/_build/results/files-Pharo11-latest9/files-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/files-Pharo11-latest9/files-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:36:05Z
files,OK,7.668,3,Pharo11,latest9,/benchy/_build/results/files-Pharo11-latest9/files-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/files-Pharo11-latest9/files-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:36:13Z
files,OK,7.781,3,Pharo11,latest10,/benchy/_build/results/files-Pharo11-latest10/files-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/files-Pharo11-latest10/files-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:36:20Z
files,OK,7.758,3,Pharo11,latest10,/benchy/_build/results/files-Pharo11-latest10/files-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/files-Pharo11-latest10/files-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:36:28Z
files,OK,7.747,3,Pharo11,latest10,/benchy/_build/results/files-Pharo11-latest10/files-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/files-Pharo11-latest10/files-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:36:36Z
files,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/files-Pharo11ComposedImage-newImageFormat/files-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/files-Pharo11ComposedImage-newImageFormat/files-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:36:36Z
files,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/files-Pharo11ComposedImage-newImageFormat/files-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/files-Pharo11ComposedImage-newImageFormat/files-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:36:36Z
files,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/files-Pharo11ComposedImage-newImageFormat/files-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/files-Pharo11ComposedImage-newImageFormat/files-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:36:36Z
startup,OK,0.730,3,Pharo10,latest9,/benchy/_build/results/startup-Pharo10-latest9/startup-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/startup-Pharo10-latest9/startup-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:36:37Z
startup,OK,0.721,3,Pharo10,latest9,/benchy/_build/results/startup-Pharo10-latest9/startup-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/startup-Pharo10-latest9/startup-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:36:37Z
startup,OK,0.726,3,Pharo10,latest9,/benchy/_build/results/startup-Pharo10-latest9/startup-Pharo10-latest9-2023-08-04.stdout,/benchy/_build/results/startup-Pharo10-latest9/startup-Pharo10-latest9-2023-08-04.stderr,2023-08-04T13:36:38Z
startup,OK,0.796,3,Pharo10,latest10,/benchy/_build/results/startup-Pharo10-latest10/startup-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/startup-Pharo10-latest10/startup-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:36:39Z
startup,OK,0.788,3,Pharo10,latest10,/benchy/_build/results/startup-Pharo10-latest10/startup-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/startup-Pharo10-latest10/startup-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:36:40Z
startup,OK,0.794,3,Pharo10,latest10,/benchy/_build/results/startup-Pharo10-latest10/startup-Pharo10-latest10-2023-08-04.stdout,/benchy/_build/results/startup-Pharo10-latest10/startup-Pharo10-latest10-2023-08-04.stderr,2023-08-04T13:36:40Z
startup,OK,0.725,3,Pharo11,latest9,/benchy/_build/results/startup-Pharo11-latest9/startup-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/startup-Pharo11-latest9/startup-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:36:41Z
startup,OK,0.722,3,Pharo11,latest9,/benchy/_build/results/startup-Pharo11-latest9/startup-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/startup-Pharo11-latest9/startup-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:36:42Z
startup,OK,0.730,3,Pharo11,latest9,/benchy/_build/results/startup-Pharo11-latest9/startup-Pharo11-latest9-2023-08-04.stdout,/benchy/_build/results/startup-Pharo11-latest9/startup-Pharo11-latest9-2023-08-04.stderr,2023-08-04T13:36:43Z
startup,OK,0.714,3,Pharo11,latest10,/benchy/_build/results/startup-Pharo11-latest10/startup-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/startup-Pharo11-latest10/startup-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:36:43Z
startup,OK,0.712,3,Pharo11,latest10,/benchy/_build/results/startup-Pharo11-latest10/startup-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/startup-Pharo11-latest10/startup-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:36:44Z
startup,OK,0.710,3,Pharo11,latest10,/benchy/_build/results/startup-Pharo11-latest10/startup-Pharo11-latest10-2023-08-04.stdout,/benchy/_build/results/startup-Pharo11-latest10/startup-Pharo11-latest10-2023-08-04.stderr,2023-08-04T13:36:45Z
startup,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/startup-Pharo11ComposedImage-newImageFormat/startup-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/startup-Pharo11ComposedImage-newImageFormat/startup-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:36:45Z
startup,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/startup-Pharo11ComposedImage-newImageFormat/startup-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/startup-Pharo11ComposedImage-newImageFormat/startup-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:36:45Z
startup,ERROR,0.001,3,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/startup-Pharo11ComposedImage-newImageFormat/startup-Pharo11ComposedImage-newImageFormat-2023-08-04.stdout,/benchy/_build/results/startup-Pharo11ComposedImage-newImageFormat/startup-Pharo11ComposedImage-newImageFormat-2023-08-04.stderr,2023-08-04T13:36:45Z
deltaBlue,OK,5.747,3,Pharo11SMark,latest9,/benchy/_build/results/deltaBlue-Pharo11SMark-latest9/deltaBlue-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/deltaBlue-Pharo11SMark-latest9/deltaBlue-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:36:51Z
deltaBlue,OK,5.745,3,Pharo11SMark,latest9,/benchy/_build/results/deltaBlue-Pharo11SMark-latest9/deltaBlue-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/deltaBlue-Pharo11SMark-latest9/deltaBlue-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:36:56Z
deltaBlue,OK,5.750,3,Pharo11SMark,latest9,/benchy/_build/results/deltaBlue-Pharo11SMark-latest9/deltaBlue-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/deltaBlue-Pharo11SMark-latest9/deltaBlue-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:37:02Z
deltaBlue,OK,5.917,3,Pharo11SMark,latest10,/benchy/_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:37:08Z
deltaBlue,OK,5.911,3,Pharo11SMark,latest10,/benchy/_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:37:14Z
deltaBlue,OK,5.894,3,Pharo11SMark,latest10,/benchy/_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:37:20Z
deltaBlue,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/deltaBlue-Pharo11ComposedImageSMark-newImageFormat/deltaBlue-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/deltaBlue-Pharo11ComposedImageSMark-newImageFormat/deltaBlue-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:37:20Z
deltaBlue,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/deltaBlue-Pharo11ComposedImageSMark-newImageFormat/deltaBlue-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/deltaBlue-Pharo11ComposedImageSMark-newImageFormat/deltaBlue-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:37:20Z
deltaBlue,ERROR,0.001,3,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/deltaBlue-Pharo11ComposedImageSMark-newImageFormat/deltaBlue-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/deltaBlue-Pharo11ComposedImageSMark-newImageFormat/deltaBlue-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:37:20Z
slopstone,OK,3.489,2,Pharo11SMark,latest9,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-07.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-07.stderr,2023-08-07T07:03:13Z
slopstone,OK,3.539,2,Pharo11SMark,latest9,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-07.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-07.stderr,2023-08-07T07:03:17Z
slopstone,OK,3.702,2,Pharo11SMark,latest10,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-07.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-07.stderr,2023-08-07T07:03:21Z
slopstone,OK,3.723,2,Pharo11SMark,latest10,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-07.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-07.stderr,2023-08-07T07:03:24Z
slopstone,ERROR,0.001,2,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stdout,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stderr,2023-08-07T07:03:24Z
slopstone,ERROR,0.001,2,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stdout,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stderr,2023-08-07T07:03:24Z
network,OK,27.661,2,Pharo10,latest9,/benchy/_build/results/network-Pharo10-latest9/network-Pharo10-latest9-2023-08-07.stdout,/benchy/_build/results/network-Pharo10-latest9/network-Pharo10-latest9-2023-08-07.stderr,2023-08-07T07:03:52Z
network,OK,25.679,2,Pharo10,latest9,/benchy/_build/results/network-Pharo10-latest9/network-Pharo10-latest9-2023-08-07.stdout,/benchy/_build/results/network-Pharo10-latest9/network-Pharo10-latest9-2023-08-07.stderr,2023-08-07T07:04:18Z
network,OK,25.790,2,Pharo10,latest10,/benchy/_build/results/network-Pharo10-latest10/network-Pharo10-latest10-2023-08-07.stdout,/benchy/_build/results/network-Pharo10-latest10/network-Pharo10-latest10-2023-08-07.stderr,2023-08-07T07:04:44Z
network,OK,28.864,2,Pharo10,latest10,/benchy/_build/results/network-Pharo10-latest10/network-Pharo10-latest10-2023-08-07.stdout,/benchy/_build/results/network-Pharo10-latest10/network-Pharo10-latest10-2023-08-07.stderr,2023-08-07T07:05:12Z
network,OK,24.619,2,Pharo11,latest9,/benchy/_build/results/network-Pharo11-latest9/network-Pharo11-latest9-2023-08-07.stdout,/benchy/_build/results/network-Pharo11-latest9/network-Pharo11-latest9-2023-08-07.stderr,2023-08-07T07:05:37Z
network,OK,25.105,2,Pharo11,latest9,/benchy/_build/results/network-Pharo11-latest9/network-Pharo11-latest9-2023-08-07.stdout,/benchy/_build/results/network-Pharo11-latest9/network-Pharo11-latest9-2023-08-07.stderr,2023-08-07T07:06:02Z
network,OK,24.827,2,Pharo11,latest10,/benchy/_build/results/network-Pharo11-latest10/network-Pharo11-latest10-2023-08-07.stdout,/benchy/_build/results/network-Pharo11-latest10/network-Pharo11-latest10-2023-08-07.stderr,2023-08-07T07:06:27Z
network,OK,24.454,2,Pharo11,latest10,/benchy/_build/results/network-Pharo11-latest10/network-Pharo11-latest10-2023-08-07.stdout,/benchy/_build/results/network-Pharo11-latest10/network-Pharo11-latest10-2023-08-07.stderr,2023-08-07T07:06:51Z
network,ERROR,0.001,2,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/network-Pharo11ComposedImage-newImageFormat/network-Pharo11ComposedImage-newImageFormat-2023-08-07.stdout,/benchy/_build/results/network-Pharo11ComposedImage-newImageFormat/network-Pharo11ComposedImage-newImageFormat-2023-08-07.stderr,2023-08-07T07:06:51Z
network,ERROR,0.001,2,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/network-Pharo11ComposedImage-newImageFormat/network-Pharo11ComposedImage-newImageFormat-2023-08-07.stdout,/benchy/_build/results/network-Pharo11ComposedImage-newImageFormat/network-Pharo11ComposedImage-newImageFormat-2023-08-07.stderr,2023-08-07T07:06:51Z
opalTests,OK,3.918,2,Pharo10,latest9,/benchy/_build/results/opalTests-Pharo10-latest9/opalTests-Pharo10-latest9-2023-08-07.stdout,/benchy/_build/results/opalTests-Pharo10-latest9/opalTests-Pharo10-latest9-2023-08-07.stderr,2023-08-07T07:06:55Z
opalTests,OK,3.965,2,Pharo10,latest9,/benchy/_build/results/opalTests-Pharo10-latest9/opalTests-Pharo10-latest9-2023-08-07.stdout,/benchy/_build/results/opalTests-Pharo10-latest9/opalTests-Pharo10-latest9-2023-08-07.stderr,2023-08-07T07:06:59Z
opalTests,OK,4.186,2,Pharo10,latest10,/benchy/_build/results/opalTests-Pharo10-latest10/opalTests-Pharo10-latest10-2023-08-07.stdout,/benchy/_build/results/opalTests-Pharo10-latest10/opalTests-Pharo10-latest10-2023-08-07.stderr,2023-08-07T07:07:04Z
opalTests,OK,4.325,2,Pharo10,latest10,/benchy/_build/results/opalTests-Pharo10-latest10/opalTests-Pharo10-latest10-2023-08-07.stdout,/benchy/_build/results/opalTests-Pharo10-latest10/opalTests-Pharo10-latest10-2023-08-07.stderr,2023-08-07T07:07:08Z
opalTests,OK,6.876,2,Pharo11,latest9,/benchy/_build/results/opalTests-Pharo11-latest9/opalTests-Pharo11-latest9-2023-08-07.stdout,/benchy/_build/results/opalTests-Pharo11-latest9/opalTests-Pharo11-latest9-2023-08-07.stderr,2023-08-07T07:07:15Z
opalTests,OK,6.997,2,Pharo11,latest9,/benchy/_build/results/opalTests-Pharo11-latest9/opalTests-Pharo11-latest9-2023-08-07.stdout,/benchy/_build/results/opalTests-Pharo11-latest9/opalTests-Pharo11-latest9-2023-08-07.stderr,2023-08-07T07:07:22Z
opalTests,OK,6.614,2,Pharo11,latest10,/benchy/_build/results/opalTests-Pharo11-latest10/opalTests-Pharo11-latest10-2023-08-07.stdout,/benchy/_build/results/opalTests-Pharo11-latest10/opalTests-Pharo11-latest10-2023-08-07.stderr,2023-08-07T07:07:28Z
opalTests,OK,6.798,2,Pharo11,latest10,/benchy/_build/results/opalTests-Pharo11-latest10/opalTests-Pharo11-latest10-2023-08-07.stdout,/benchy/_build/results/opalTests-Pharo11-latest10/opalTests-Pharo11-latest10-2023-08-07.stderr,2023-08-07T07:07:35Z
opalTests,ERROR,0.001,2,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/opalTests-Pharo11ComposedImage-newImageFormat/opalTests-Pharo11ComposedImage-newImageFormat-2023-08-07.stdout,/benchy/_build/results/opalTests-Pharo11ComposedImage-newImageFormat/opalTests-Pharo11ComposedImage-newImageFormat-2023-08-07.stderr,2023-08-07T07:07:35Z
opalTests,ERROR,0.001,2,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/opalTests-Pharo11ComposedImage-newImageFormat/opalTests-Pharo11ComposedImage-newImageFormat-2023-08-07.stdout,/benchy/_build/results/opalTests-Pharo11ComposedImage-newImageFormat/opalTests-Pharo11ComposedImage-newImageFormat-2023-08-07.stderr,2023-08-07T07:07:35Z
smarkCompiler,OK,5.571,2,Pharo11SMark,latest9,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest9/smarkCompiler-Pharo11SMark-latest9-2023-08-07.stdout,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest9/smarkCompiler-Pharo11SMark-latest9-2023-08-07.stderr,2023-08-07T07:07:41Z
smarkCompiler,OK,5.539,2,Pharo11SMark,latest9,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest9/smarkCompiler-Pharo11SMark-latest9-2023-08-07.stdout,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest9/smarkCompiler-Pharo11SMark-latest9-2023-08-07.stderr,2023-08-07T07:07:46Z
smarkCompiler,OK,5.776,2,Pharo11SMark,latest10,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest10/smarkCompiler-Pharo11SMark-latest10-2023-08-07.stdout,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest10/smarkCompiler-Pharo11SMark-latest10-2023-08-07.stderr,2023-08-07T07:07:52Z
smarkCompiler,OK,5.759,2,Pharo11SMark,latest10,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest10/smarkCompiler-Pharo11SMark-latest10-2023-08-07.stdout,/benchy/_build/results/smarkCompiler-Pharo11SMark-latest10/smarkCompiler-Pharo11SMark-latest10-2023-08-07.stderr,2023-08-07T07:07:58Z
smarkCompiler,ERROR,0.001,2,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stdout,/benchy/_build/results/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stderr,2023-08-07T07:07:58Z
smarkCompiler,ERROR,0.001,2,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stdout,/benchy/_build/results/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat/smarkCompiler-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stderr,2023-08-07T07:07:58Z
kernelTests,OK,11.861,2,Pharo10,latest9,/benchy/_build/results/kernelTests-Pharo10-latest9/kernelTests-Pharo10-latest9-2023-08-07.stdout,/benchy/_build/results/kernelTests-Pharo10-latest9/kernelTests-Pharo10-latest9-2023-08-07.stderr,2023-08-07T07:08:10Z
kernelTests,OK,11.116,2,Pharo10,latest9,/benchy/_build/results/kernelTests-Pharo10-latest9/kernelTests-Pharo10-latest9-2023-08-07.stdout,/benchy/_build/results/kernelTests-Pharo10-latest9/kernelTests-Pharo10-latest9-2023-08-07.stderr,2023-08-07T07:08:21Z
kernelTests,OK,11.856,2,Pharo10,latest10,/benchy/_build/results/kernelTests-Pharo10-latest10/kernelTests-Pharo10-latest10-2023-08-07.stdout,/benchy/_build/results/kernelTests-Pharo10-latest10/kernelTests-Pharo10-latest10-2023-08-07.stderr,2023-08-07T07:08:33Z
kernelTests,OK,11.593,2,Pharo10,latest10,/benchy/_build/results/kernelTests-Pharo10-latest10/kernelTests-Pharo10-latest10-2023-08-07.stdout,/benchy/_build/results/kernelTests-Pharo10-latest10/kernelTests-Pharo10-latest10-2023-08-07.stderr,2023-08-07T07:08:44Z
kernelTests,OK,11.779,2,Pharo11,latest9,/benchy/_build/results/kernelTests-Pharo11-latest9/kernelTests-Pharo11-latest9-2023-08-07.stdout,/benchy/_build/results/kernelTests-Pharo11-latest9/kernelTests-Pharo11-latest9-2023-08-07.stderr,2023-08-07T07:08:56Z
kernelTests,OK,11.767,2,Pharo11,latest9,/benchy/_build/results/kernelTests-Pharo11-latest9/kernelTests-Pharo11-latest9-2023-08-07.stdout,/benchy/_build/results/kernelTests-Pharo11-latest9/kernelTests-Pharo11-latest9-2023-08-07.stderr,2023-08-07T07:09:08Z
kernelTests,OK,11.821,2,Pharo11,latest10,/benchy/_build/results/kernelTests-Pharo11-latest10/kernelTests-Pharo11-latest10-2023-08-07.stdout,/benchy/_build/results/kernelTests-Pharo11-latest10/kernelTests-Pharo11-latest10-2023-08-07.stderr,2023-08-07T07:09:20Z
kernelTests,OK,11.735,2,Pharo11,latest10,/benchy/_build/results/kernelTests-Pharo11-latest10/kernelTests-Pharo11-latest10-2023-08-07.stdout,/benchy/_build/results/kernelTests-Pharo11-latest10/kernelTests-Pharo11-latest10-2023-08-07.stderr,2023-08-07T07:09:31Z
kernelTests,ERROR,0.001,2,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/kernelTests-Pharo11ComposedImage-newImageFormat/kernelTests-Pharo11ComposedImage-newImageFormat-2023-08-07.stdout,/benchy/_build/results/kernelTests-Pharo11ComposedImage-newImageFormat/kernelTests-Pharo11ComposedImage-newImageFormat-2023-08-07.stderr,2023-08-07T07:09:32Z
kernelTests,ERROR,0.001,2,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/kernelTests-Pharo11ComposedImage-newImageFormat/kernelTests-Pharo11ComposedImage-newImageFormat-2023-08-07.stdout,/benchy/_build/results/kernelTests-Pharo11ComposedImage-newImageFormat/kernelTests-Pharo11ComposedImage-newImageFormat-2023-08-07.stderr,2023-08-07T07:09:32Z
richards,OK,4.251,2,Pharo11SMark,latest9,/benchy/_build/results/richards-Pharo11SMark-latest9/richards-Pharo11SMark-latest9-2023-08-07.stdout,/benchy/_build/results/richards-Pharo11SMark-latest9/richards-Pharo11SMark-latest9-2023-08-07.stderr,2023-08-07T07:09:36Z
richards,OK,4.212,2,Pharo11SMark,latest9,/benchy/_build/results/richards-Pharo11SMark-latest9/richards-Pharo11SMark-latest9-2023-08-07.stdout,/benchy/_build/results/richards-Pharo11SMark-latest9/richards-Pharo11SMark-latest9-2023-08-07.stderr,2023-08-07T07:09:40Z
richards,OK,4.429,2,Pharo11SMark,latest10,/benchy/_build/results/richards-Pharo11SMark-latest10/richards-Pharo11SMark-latest10-2023-08-07.stdout,/benchy/_build/results/richards-Pharo11SMark-latest10/richards-Pharo11SMark-latest10-2023-08-07.stderr,2023-08-07T07:09:44Z
richards,OK,4.383,2,Pharo11SMark,latest10,/benchy/_build/results/richards-Pharo11SMark-latest10/richards-Pharo11SMark-latest10-2023-08-07.stdout,/benchy/_build/results/richards-Pharo11SMark-latest10/richards-Pharo11SMark-latest10-2023-08-07.stderr,2023-08-07T07:09:49Z
richards,ERROR,0.001,2,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/richards-Pharo11ComposedImageSMark-newImageFormat/richards-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stdout,/benchy/_build/results/richards-Pharo11ComposedImageSMark-newImageFormat/richards-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stderr,2023-08-07T07:09:49Z
richards,ERROR,0.001,2,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/richards-Pharo11ComposedImageSMark-newImageFormat/richards-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stdout,/benchy/_build/results/richards-Pharo11ComposedImageSMark-newImageFormat/richards-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stderr,2023-08-07T07:09:49Z
files,OK,7.291,2,Pharo10,latest9,/benchy/_build/results/files-Pharo10-latest9/files-Pharo10-latest9-2023-08-07.stdout,/benchy/_build/results/files-Pharo10-latest9/files-Pharo10-latest9-2023-08-07.stderr,2023-08-07T07:09:56Z
files,OK,7.265,2,Pharo10,latest9,/benchy/_build/results/files-Pharo10-latest9/files-Pharo10-latest9-2023-08-07.stdout,/benchy/_build/results/files-Pharo10-latest9/files-Pharo10-latest9-2023-08-07.stderr,2023-08-07T07:10:03Z
files,OK,7.397,2,Pharo10,latest10,/benchy/_build/results/files-Pharo10-latest10/files-Pharo10-latest10-2023-08-07.stdout,/benchy/_build/results/files-Pharo10-latest10/files-Pharo10-latest10-2023-08-07.stderr,2023-08-07T07:10:11Z
files,OK,7.407,2,Pharo10,latest10,/benchy/_build/results/files-Pharo10-latest10/files-Pharo10-latest10-2023-08-07.stdout,/benchy/_build/results/files-Pharo10-latest10/files-Pharo10-latest10-2023-08-07.stderr,2023-08-07T07:10:18Z
files,OK,7.649,2,Pharo11,latest9,/benchy/_build/results/files-Pharo11-latest9/files-Pharo11-latest9-2023-08-07.stdout,/benchy/_build/results/files-Pharo11-latest9/files-Pharo11-latest9-2023-08-07.stderr,2023-08-07T07:10:26Z
files,OK,7.626,2,Pharo11,latest9,/benchy/_build/results/files-Pharo11-latest9/files-Pharo11-latest9-2023-08-07.stdout,/benchy/_build/results/files-Pharo11-latest9/files-Pharo11-latest9-2023-08-07.stderr,2023-08-07T07:10:34Z
files,OK,7.759,2,Pharo11,latest10,/benchy/_build/results/files-Pharo11-latest10/files-Pharo11-latest10-2023-08-07.stdout,/benchy/_build/results/files-Pharo11-latest10/files-Pharo11-latest10-2023-08-07.stderr,2023-08-07T07:10:41Z
files,OK,7.787,2,Pharo11,latest10,/benchy/_build/results/files-Pharo11-latest10/files-Pharo11-latest10-2023-08-07.stdout,/benchy/_build/results/files-Pharo11-latest10/files-Pharo11-latest10-2023-08-07.stderr,2023-08-07T07:10:49Z
files,ERROR,0.001,2,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/files-Pharo11ComposedImage-newImageFormat/files-Pharo11ComposedImage-newImageFormat-2023-08-07.stdout,/benchy/_build/results/files-Pharo11ComposedImage-newImageFormat/files-Pharo11ComposedImage-newImageFormat-2023-08-07.stderr,2023-08-07T07:10:49Z
files,ERROR,0.001,2,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/files-Pharo11ComposedImage-newImageFormat/files-Pharo11ComposedImage-newImageFormat-2023-08-07.stdout,/benchy/_build/results/files-Pharo11ComposedImage-newImageFormat/files-Pharo11ComposedImage-newImageFormat-2023-08-07.stderr,2023-08-07T07:10:49Z
startup,OK,0.731,2,Pharo10,latest9,/benchy/_build/results/startup-Pharo10-latest9/startup-Pharo10-latest9-2023-08-07.stdout,/benchy/_build/results/startup-Pharo10-latest9/startup-Pharo10-latest9-2023-08-07.stderr,2023-08-07T07:10:50Z
startup,OK,0.726,2,Pharo10,latest9,/benchy/_build/results/startup-Pharo10-latest9/startup-Pharo10-latest9-2023-08-07.stdout,/benchy/_build/results/startup-Pharo10-latest9/startup-Pharo10-latest9-2023-08-07.stderr,2023-08-07T07:10:51Z
startup,OK,0.799,2,Pharo10,latest10,/benchy/_build/results/startup-Pharo10-latest10/startup-Pharo10-latest10-2023-08-07.stdout,/benchy/_build/results/startup-Pharo10-latest10/startup-Pharo10-latest10-2023-08-07.stderr,2023-08-07T07:10:51Z
startup,OK,0.801,2,Pharo10,latest10,/benchy/_build/results/startup-Pharo10-latest10/startup-Pharo10-latest10-2023-08-07.stdout,/benchy/_build/results/startup-Pharo10-latest10/startup-Pharo10-latest10-2023-08-07.stderr,2023-08-07T07:10:52Z
startup,OK,0.733,2,Pharo11,latest9,/benchy/_build/results/startup-Pharo11-latest9/startup-Pharo11-latest9-2023-08-07.stdout,/benchy/_build/results/startup-Pharo11-latest9/startup-Pharo11-latest9-2023-08-07.stderr,2023-08-07T07:10:53Z
startup,OK,0.734,2,Pharo11,latest9,/benchy/_build/results/startup-Pharo11-latest9/startup-Pharo11-latest9-2023-08-07.stdout,/benchy/_build/results/startup-Pharo11-latest9/startup-Pharo11-latest9-2023-08-07.stderr,2023-08-07T07:10:54Z
startup,OK,0.730,2,Pharo11,latest10,/benchy/_build/results/startup-Pharo11-latest10/startup-Pharo11-latest10-2023-08-07.stdout,/benchy/_build/results/startup-Pharo11-latest10/startup-Pharo11-latest10-2023-08-07.stderr,2023-08-07T07:10:54Z
startup,OK,0.718,2,Pharo11,latest10,/benchy/_build/results/startup-Pharo11-latest10/startup-Pharo11-latest10-2023-08-07.stdout,/benchy/_build/results/startup-Pharo11-latest10/startup-Pharo11-latest10-2023-08-07.stderr,2023-08-07T07:10:55Z
startup,ERROR,0.001,2,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/startup-Pharo11ComposedImage-newImageFormat/startup-Pharo11ComposedImage-newImageFormat-2023-08-07.stdout,/benchy/_build/results/startup-Pharo11ComposedImage-newImageFormat/startup-Pharo11ComposedImage-newImageFormat-2023-08-07.stderr,2023-08-07T07:10:55Z
startup,ERROR,0.001,2,Pharo11ComposedImage,newImageFormat,/benchy/_build/results/startup-Pharo11ComposedImage-newImageFormat/startup-Pharo11ComposedImage-newImageFormat-2023-08-07.stdout,/benchy/_build/results/startup-Pharo11ComposedImage-newImageFormat/startup-Pharo11ComposedImage-newImageFormat-2023-08-07.stderr,2023-08-07T07:10:55Z
deltaBlue,OK,5.803,2,Pharo11SMark,latest9,/benchy/_build/results/deltaBlue-Pharo11SMark-latest9/deltaBlue-Pharo11SMark-latest9-2023-08-07.stdout,/benchy/_build/results/deltaBlue-Pharo11SMark-latest9/deltaBlue-Pharo11SMark-latest9-2023-08-07.stderr,2023-08-07T07:11:01Z
deltaBlue,OK,5.768,2,Pharo11SMark,latest9,/benchy/_build/results/deltaBlue-Pharo11SMark-latest9/deltaBlue-Pharo11SMark-latest9-2023-08-07.stdout,/benchy/_build/results/deltaBlue-Pharo11SMark-latest9/deltaBlue-Pharo11SMark-latest9-2023-08-07.stderr,2023-08-07T07:11:07Z
deltaBlue,OK,5.989,2,Pharo11SMark,latest10,/benchy/_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-2023-08-07.stdout,/benchy/_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-2023-08-07.stderr,2023-08-07T07:11:13Z
deltaBlue,OK,6.000,2,Pharo11SMark,latest10,/benchy/_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-2023-08-07.stdout,/benchy/_build/results/deltaBlue-Pharo11SMark-latest10/deltaBlue-Pharo11SMark-latest10-2023-08-07.stderr,2023-08-07T07:11:19Z
deltaBlue,ERROR,0.001,2,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/deltaBlue-Pharo11ComposedImageSMark-newImageFormat/deltaBlue-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stdout,/benchy/_build/results/deltaBlue-Pharo11ComposedImageSMark-newImageFormat/deltaBlue-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stderr,2023-08-07T07:11:19Z
deltaBlue,ERROR,0.001,2,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/deltaBlue-Pharo11ComposedImageSMark-newImageFormat/deltaBlue-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stdout,/benchy/_build/results/deltaBlue-Pharo11ComposedImageSMark-newImageFormat/deltaBlue-Pharo11ComposedImageSMark-newImageFormat-2023-08-07.stderr,2023-08-07T07:11:19Z

'
]

{ #category : #running }
BenchyTestCase >> sampleBenchmarksEmpty [

	^ ''
]

{ #category : #running }
BenchyTestCase >> sampleBenchmarksMultipleIterations [

	^ ''
]

{ #category : #running }
BenchyTestCase >> sampleBenchmarksOneIteration [

	^ 'header1Line
	header2ndLine
slopstone,OK,3.534,1,Pharo11SMark,latest9,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-02.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-02.stderr,2023-08-02T16:41:59Z
slopstone,OK,3.692,1,Pharo11SMark,latest10,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-02.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-02.stderr,2023-08-02T16:42:03Z
slopstone,ERROR,0.001,1,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-02.stdout,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-02.stderr,2023-08-02T16:42:03Z
slopstone,OK,3.494,1,Pharo11SMark,latest9,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest9/slopstone-Pharo11SMark-latest9-2023-08-04.stderr,2023-08-04T13:24:05Z
slopstone,OK,3.697,1,Pharo11SMark,latest10,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11SMark-latest10/slopstone-Pharo11SMark-latest10-2023-08-04.stderr,2023-08-04T13:24:09Z
slopstone,ERROR,0.001,1,Pharo11ComposedImageSMark,newImageFormat,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stdout,/benchy/_build/results/slopstone-Pharo11ComposedImageSMark-newImageFormat/slopstone-Pharo11ComposedImageSMark-newImageFormat-2023-08-04.stderr,2023-08-04T13:24:09Z'
]

{ #category : #running }
BenchyTestCase >> setUp [

	super setUp.

	benchyHistory := BenchyHistory new.
]

{ #category : #running }
BenchyTestCase >> testReadingEmptyMeasurementEntries [

	self benchyHistory benchmarksReadStream: self sampleBenchmarksEmpty readStream.
	
	self assert: self benchyHistory readBenchmarkEntries isEmpty

]

{ #category : #running }
BenchyTestCase >> testReadingOneIterationMeasurementEntries [

	self benchyHistory benchmarksReadStream: self sampleBenchmarksOneIteration readStream.
	
	self assert: self benchyHistory readBenchmarkEntries size equals: 6

]

{ #category : #running }
BenchyTestCase >> testSelectingOneIterationMeasurementEntries [

	| entries |
	
	self benchyHistory benchmarksReadStream: self sampleBenchmarksComplete readStream.
	entries := self benchyHistory readBenchmarkEntries.
	self 
		assert: (entries select: [ : e | e iterationsCount = 1 ]) size 
		equals: 6 
]
