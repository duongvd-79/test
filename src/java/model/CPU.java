package model;

public class CPU {

    /*
        [cpuID] [int] IDENTITY(1,1) NOT NULL,
	[# of Displays Support] [varchar](512) NULL,
	[4K Support] [varchar](512) NULL,
	[Base Frequency] [varchar](512) NULL,
	[Bus Speed] [varchar](512) NULL,
	[Cache] [varchar](512) NULL,
	[Core] [int] NULL,
	[DirectX Support] [varchar](512) NULL,
	[Family] [varchar](512) NULL,
	[GPU Base Frequency] [varchar](512) NULL,
	[Integrated GPU] [varchar](512) NULL,
	[Lithography] [varchar](512) NULL,
	[Max Memory Size] [varchar](512) NULL,
	[Max Turbo Frequency] [varchar](512) NULL,
	[Memory Type] [varchar](512) NULL,
	[Title] [varchar](512) NULL,
	[OpenGL Support] [varchar](512) NULL,
	[Socket] [varchar](512) NULL,
	[TDP] [varchar](512) NULL,
	[Thread] [int] NULL,
	[Model Number] [varchar](512) NULL,
	[Image] [varchar](512) NULL,
	[manufacturerID] [int] NULL,
     */
    private String numbersOfDisplays, support4K, baseFreq, busSpeed,
            cache, directX, family, gpuBaseFreq, integratedGPU, lithography,
            maxMemory, maxTurboFreq, memType, title, openGL, socket, tdp, modelNumber, img;
    private int cpuID, core, thread, manufacturerID;

    public CPU() {
    }

    public String getNumbersOfDisplays() {
        return numbersOfDisplays;
    }

    public void setNumbersOfDisplays(String numbersOfDisplays) {
        this.numbersOfDisplays = numbersOfDisplays;
    }

    public String getSupport4K() {
        return support4K;
    }

    public void setSupport4K(String support4K) {
        this.support4K = support4K;
    }

    public String getBaseFreq() {
        return baseFreq;
    }

    public void setBaseFreq(String baseFreq) {
        this.baseFreq = baseFreq;
    }

    public String getBusSpeed() {
        return busSpeed;
    }

    public void setBusSpeed(String busSpeed) {
        this.busSpeed = busSpeed;
    }

    public String getCache() {
        return cache;
    }

    public void setCache(String cache) {
        this.cache = cache;
    }

    public String getDirectX() {
        return directX;
    }

    public void setDirectX(String directX) {
        this.directX = directX;
    }

    public String getFamily() {
        return family;
    }

    public void setFamily(String family) {
        this.family = family;
    }

    public String getGpuBaseFreq() {
        return gpuBaseFreq;
    }

    public void setGpuBaseFreq(String gpuBaseFreq) {
        this.gpuBaseFreq = gpuBaseFreq;
    }

    public String getIntegratedGPU() {
        return integratedGPU;
    }

    public void setIntegratedGPU(String integratedGPU) {
        this.integratedGPU = integratedGPU;
    }

    public String getLithography() {
        return lithography;
    }

    public void setLithography(String lithography) {
        this.lithography = lithography;
    }

    public String getMaxMemory() {
        return maxMemory;
    }

    public void setMaxMemory(String maxMemory) {
        this.maxMemory = maxMemory;
    }

    public String getMaxTurboFreq() {
        return maxTurboFreq;
    }

    public void setMaxTurboFreq(String maxTurboFreq) {
        this.maxTurboFreq = maxTurboFreq;
    }

    public String getMemType() {
        return memType;
    }

    public void setMemType(String memType) {
        this.memType = memType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOpenGL() {
        return openGL;
    }

    public void setOpenGL(String openGL) {
        this.openGL = openGL;
    }

    public String getSocket() {
        return socket;
    }

    public void setSocket(String socket) {
        this.socket = socket;
    }

    public String getTdp() {
        return tdp;
    }

    public void setTdp(String tdp) {
        this.tdp = tdp;
    }

    public String getModelNumber() {
        return modelNumber;
    }

    public void setModelNumber(String modelNumber) {
        this.modelNumber = modelNumber;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getCpuID() {
        return cpuID;
    }

    public void setCpuID(int cpuID) {
        this.cpuID = cpuID;
    }

    public int getCore() {
        return core;
    }

    public void setCore(int core) {
        this.core = core;
    }

    public int getThread() {
        return thread;
    }

    public void setThread(int thread) {
        this.thread = thread;
    }

    public int getManufacturerID() {
        return manufacturerID;
    }

    public void setManufacturerID(int manufacturerID) {
        this.manufacturerID = manufacturerID;
    }

    @Override
    public String toString() {
        return "CPU{" + "numbersOfDisplays=" + numbersOfDisplays + ", support4K=" + support4K + ", baseFreq=" + baseFreq + ", busSpeed=" + busSpeed + ", cache=" + cache + ", directX=" + directX + ", family=" + family + ", gpuBaseFreq=" + gpuBaseFreq + ", integratedGPU=" + integratedGPU + ", lithography=" + lithography + ", maxMemory=" + maxMemory + ", maxTurboFreq=" + maxTurboFreq + ", memType=" + memType + ", title=" + title + ", openGL=" + openGL + ", socket=" + socket + ", tdp=" + tdp + ", modelNumber=" + modelNumber + ", img=" + img + ", cpuID=" + cpuID + ", core=" + core + ", thread=" + thread + ", manufacturerID=" + manufacturerID + '}';
    }

}
