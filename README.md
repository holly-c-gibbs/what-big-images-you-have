# what-big-images-you-have
Here you can find a frequently updated compilation of beginner resources for open source visualization and analysis of scary big n-dimensional microscopy image data :wolf: . Suggestions welcome... just start an issue, or if you'd like to contribute that's great! 

## tl:dr
1. Join [**Image.sc**](https://forum.image.sc/) where a welcoming and responsive community of open software developers and users will help you with all. the. questions. :100: :100: :100:  
2. **Even with the best hardware and the most nodes, for large datasets you need smart software design.** 
3. Luckily, the bioimage analysis community has forseen the :boom: of image data and the :poop: we might step in. 
4. These heros are working tirelessly to create and/or integrate the best image processing libraries into platforms that are accessible to life science researchers so we can get things done. :muscle:  
5. **These tools are constantly evolving, and if there's a feature you wish you had... tell the community!** :speaking_head:
6.  Realize this is going to be hard, but you can do it (for science)! :nerd_face: 
7. **But don't make things harder than they need to be. Acquire data at the lowest resolution that adequately addresses your research problem. Pilot all your pipelines using subsets of data.**   
8. Not everything will be fully automatated and robust :robot:. Aim for semi-automated workflows and/or automated processing with human-supervised quality control checkpoints.
9. Give back by citing what you use, writing :stuck_out_tongue_winking_eye: emoji-laden guides like this one, or contributing annotated data sets, ideas :bulb:, and code (**yes even you**). 


### Software environments where you can best the big bad image data :wolf: (without an army of undergraduates to do everything manually, though that would make some nice ground truth data for training deep learning networks)
1. [**Java**](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html), the first "write once, run everywhere" software, is still groovy. ImageJ's incarnation as [**FIJI**](https://fiji.sc/), utilizing [**ImgLib2**](https://imglib2.net) uses an efficient n-dimensional data containers and has a variety of plugins that are useful for different tiers of "big image data". [**FIJI scripting**](https://imagej.github.io/presentations/fiji-scripting/#/) supports other languages (eg. Groovy, Python, Beanshell, ...) and [**ImageJOps**](https://imagej.net/ImageJ_Ops) makes creating and sharing workflows pretty fun actually! The project is maintained by [**LOCI**](https://loci.wisc.edu/).      
2. [**Python**](https://www.anaconda.com/distribution/) is an accessible language for beginning programmers with many useful packages for image processing (eg. [**scikit-image**](https://scikit-image.org/) (utilizing [**scipy**](https://www.scipy.org/))) and visualization (eg. [**vispy**](http://vispy.org/)), data analysis(eg. [**pandas**](https://pandas.pydata.org/)), deep learning (eg. [**pytorch**](https://pytorch.org/)), and importantly, distributed computing (eg. [**dask**](https://dask.org/)).
3. [**Vaa3D**](https://alleninstitute.org/what-we-do/brain-science/research/products-tools/vaa3d/) is close to the metal C/C++ and designed to be fast for visualizing and analyzing terabyte size datasets and connected with the Allen Brain Institute.  
4. Why choose? You can also aggregate the different tools above or anything you can run from the command line in software like [**KNIME**](https://www.knime.com/community/image-processing) and [**Icy**](http://icy.bioimageanalysis.org/).

If you're coming at this having trained as a biologist and the number of options feels overwhelming, it's ok. The variety is similar to the variety of protocols you would have to choose from and optimize to do any number of things in a wet lab. There's no way for you to overcome that other than to just play around with the different options.  


### Stages of adjusting to big image data
**Sample prep worked out and the images looked beautiful on the microscope. Now what?** 

#### Just please let me get my data from the acquisition machine.
1. Splurge for a solid-state external drive (probably exFAT formatted, should work on Windows/Mac/Linux) of reasonable size (at least 256 GB) if there is not a fast network connection to send over.
#### Just please let me see my data :eyes: 
1. If your dataset can fit in the GPU memory, [**ClearVolume**](https://clearvolume.github.io/) is :fire:.
2. If your dataset is bigger than the GPU or even CPU memory, [**BigDataViewer**](https://imagej.net/BigDataViewer) quickly renders arbitrary slices from multidimensional data sets and has a demo version of a fast volume viewer. [**Napari**](https://github.com/napari/napari) is :zap: fast and if you prefer Python, a fantastic interactive tool with a lot of momentum. [**Vaa3D**](https://alleninstitute.org/what-we-do/brain-science/research/products-tools/vaa3d/) was my volume rendering workhorse during grad school and is still :star:. 
