Pneumothorax detection and segmentation in chest X-rays is a critical task in medical imaging that requires accurate and
efficient diagnostic tools. This paper addresses the challenge of balancing computational efficiency with high accuracy in
pneumothorax detection and segmentation, particularly in the context of limited computational resources and the need for real-time
analysis. Existing solutions often rely on single-scale models or complex architectures that may struggle with generalization across
diverse datasets or require significant computational power. To overcome these limitations, I have built a novel multi-scale ensemble
approach that combines U-Net models trained on different image resolutions, leveraging a ResNet34 encoder and incorporating
advanced techniques such as spatial and channel squeeze-and-excitation (scSE) modules. My Multi-Scale-Unet-Ensemble
model has achieved a dice similarity coefficient of 0.855. I've used the SIIM ACR Pneumothorax Segmentation dataset, which is 
larger and of higher quality, ensuring improved performance and robustness across diverse cases.

![image](https://github.com/user-attachments/assets/932ce00a-5d81-4630-b93d-39f4693c4863)
