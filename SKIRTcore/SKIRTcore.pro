#-------------------------------------------------
#  SKIRT -- an advanced radiative transfer code
#  © Astronomical Observatory, Ghent University
#-------------------------------------------------

#---------------------------------------------------------------------
# This library provides the core SKIRT functionality, including all
# simulation item classes plus some SKIRT-specific support classes.
#---------------------------------------------------------------------

# overall setup
TEMPLATE = lib
TARGET = skirtcore
QT -= gui
CONFIG *= staticlib create_prl thread c++11

# compile with maximum optimization
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE += -O3

# include libraries internal to the project
INCLUDEPATH += $$PWD/../Fundamentals $$PWD/../Cfitsio $$PWD/../Voro $$PWD/../MPIsupport
DEPENDPATH += $$PWD/../Fundamentals $$PWD/../Cfitsio $$PWD/../Voro $$PWD/../MPIsupport
unix: LIBS += -L$$OUT_PWD/../Fundamentals/ -lfundamentals \
              -L$$OUT_PWD/../Cfitsio/ -lcfitsio \
              -L$$OUT_PWD/../Voro/ -lvoro \
              -L$$OUT_PWD/../MPIsupport/ -lmpisupport
unix: PRE_TARGETDEPS += $$OUT_PWD/../Fundamentals/libfundamentals.a \
                        $$OUT_PWD/../Cfitsio/libcfitsio.a \
                        $$OUT_PWD/../Voro/libvoro.a \
                        $$OUT_PWD/../MPIsupport/libmpisupport.a

#--------------------------------------------------
# source and header files: maintained by Qt creator
#--------------------------------------------------

HEADERS += \
    AdaptiveMesh.hpp \
    AdaptiveMeshAmrvacFile.hpp \
    AdaptiveMeshAsciiFile.hpp \
    AdaptiveMeshDustDistribution.hpp \
    AdaptiveMeshDustGrid.hpp \
    AdaptiveMeshFile.hpp \
    AdaptiveMeshGeometry.hpp \
    AdaptiveMeshInterface.hpp \
    AdaptiveMeshNode.hpp \
    AdaptiveMeshStellarComp.hpp \
    AllCellsDustLib.hpp \
    AmHydrocarbonGrainComposition.hpp \
    AngularDistribution.hpp \
    AxGeometry.hpp \
    BaryBinTreeNode.hpp \
    BaryOctTreeNode.hpp \
    Benchmark1DDustMix.hpp \
    Benchmark2DDustMix.hpp \
    BinTreeDustGrid.hpp \
    BinTreeNode.hpp \
    BlackBodySED.hpp \
    BolLuminosityStellarCompNormalization.hpp \
    BoxDustGrid.hpp \
    CartesianDustGrid.hpp \
    BruzualCharlotSED.hpp \
    BruzualCharlotSEDFamily.hpp \
    ClumpyGeometryDecorator.hpp \
    CombineGeometryDecorator.hpp \
    CompDustDistribution.hpp \
    ConfigurableDustMix.hpp \
    ConicalShellGeometry.hpp \
    Console.hpp \
    CropGeometryDecorator.hpp \
    CubBackgroundGeometry.hpp \
    CubicSplineSmoothingKernel.hpp \
    Cylinder2DDustGrid.hpp \
    CylinderDustGrid.hpp \
    CylindricalCavityGeometryDecorator.hpp \
    Dim1DustLib.hpp \
    Dim2DustLib.hpp \
    Direction.hpp \
    DistantInstrument.hpp \
    DraineGraphiteGrainComposition.hpp \
    DraineIonizedPAHGrainComposition.hpp \
    DraineLiDustMix.hpp \
    DraineNeutralPAHGrainComposition.hpp \
    DraineSilicateGrainComposition.hpp \
    DustComp.hpp \
    DustCompNormalization.hpp \
    DustDistribution.hpp \
    DustEmGrainComposition.hpp \
    DustEmissivity.hpp \
    DustGrid.hpp \
    DustGridDensityInterface.hpp \
    DustGridPath.hpp \
    DustGridPlotFile.hpp \
    DustLib.hpp \
    DustMassDustCompNormalization.hpp \
    DustMassInBoxInterface.hpp \
    DustMix.hpp \
    DustMixPopulation.hpp \
    DustParticleInterface.hpp \
    DustSystem.hpp \
    DustSystemDensityCalculator.hpp \
    DustSystemDepthCalculator.hpp \
    EdgeOnDustCompNormalization.hpp \
    EinastoGeometry.hpp \
    ElectronDustMix.hpp \
    EnstatiteGrainComposition.hpp \
    ExpDiskGeometry.hpp \
    ExtragalacticUnits.hpp \
    FITSInOut.hpp \
    FaceOnDustCompNormalization.hpp \
    FatalError.hpp \
    FileGrainComposition.hpp \
    FileLog.hpp \
    FilePaths.hpp \
    FileSED.hpp \
    FileWavelengthGrid.hpp \
    Foam.hpp \
    FoamAxGeometry.hpp \
    FoamCell.hpp \
    FoamDensity.hpp \
    FoamGeometry.hpp \
    FoamGeometryDecorator.hpp \
    FoamHistogram.hpp \
    FoamMatrix.hpp \
    FoamPartition.hpp \
    FoamVector.hpp \
    ForsteriteGrainComposition.hpp \
    FrameInstrument.hpp \
    FullInstrument.hpp \
    GammaGeometry.hpp \
    GaussianGeometry.hpp \
    GenGeometry.hpp \
    GeometricStellarComp.hpp \
    Geometry.hpp \
    GrainComposition.hpp \
    GrainSizeDistribution.hpp \
    GrainSizeDistributionInterface.hpp \
    GreyBodyDustEmissivity.hpp \
    HomogeneousTransform.hpp \
    ISRF.hpp \
    IdenticalAssigner.hpp \
    Image.hpp \
    Instrument.hpp \
    InstrumentFrame.hpp \
    InstrumentSystem.hpp \
    InterstellarDustMix.hpp \
    KuruczSED.hpp \
    LaserGeometry.hpp \
    LinMesh.hpp \
    Log.hpp \
    LogNormalGrainSizeDistribution.hpp \
    LogWavelengthGrid.hpp \
    LuminosityStellarCompNormalization.hpp \
    MGEGeometry.hpp \
    MRNDustMix.hpp \
    MappingsSED.hpp \
    MappingsSEDFamily.hpp \
    MarastonSED.hpp \
    MasterSlaveCommunicator.hpp \
    MeanZubkoDustMix.hpp \
    Mesh.hpp \
    MeshDustComponent.hpp \
    MieSilicateGrainComposition.hpp \
    MinSilicateGrainComposition.hpp \
    ModifiedLogNormalGrainSizeDistribution.hpp \
    ModifiedPowerLawGrainSizeDistribution.hpp \
    MonteCarloSimulation.hpp \
    MultiFrameInstrument.hpp \
    MultiGrainDustMix.hpp \
    NestedLogWavelengthGrid.hpp \
    NetzerAccretionDiskGeometry.hpp \
    OctTreeDustGrid.hpp \
    OctTreeNode.hpp \
    OffsetGeometryDecorator.hpp \
    OligoDustSystem.hpp \
    OligoMonteCarloSimulation.hpp \
    OligoStellarComp.hpp \
    OligoWavelengthGrid.hpp \
    PanDustSystem.hpp \
    PanMonteCarloSimulation.hpp \
    PanStellarComp.hpp \
    PanWavelengthGrid.hpp \
    Parallel.hpp \
    ParallelFactory.hpp \
    ParallelTarget.hpp \
    ParticleTreeDustGrid.hpp \
    PeerToPeerCommunicator.hpp \
    PegaseSED.hpp \
    PerspectiveInstrument.hpp \
    PhotonPackage.hpp \
    PlanckFunction.hpp \
    PlummerGeometry.hpp \
    PointGeometry.hpp \
    PolarizedGraphiteGrainComposition.hpp \
    PolarizedSilicateGrainComposition.hpp \
    Position.hpp \
    PowMesh.hpp \
    PowerLawGrainSizeDistribution.hpp \
    ProcessAssigner.hpp \
    ProcessCommunicator.hpp \
    PseudoSersicGeometry.hpp \
    QuasarSED.hpp \
    RadialDustCompNormalization.hpp \
    Random.hpp \
    RandomAssigner.hpp \
    RangeGrainSizeDistribution.hpp \
    ReadFitsGeometry.hpp \
    RingGeometry.hpp \
    RootAssigner.hpp \
    RotateGeometryDecorator.hpp \
    SED.hpp \
    SEDFamily.hpp \
    SEDInstrument.hpp \
    SIUnits.hpp \
    SPHDustDistribution.hpp \
    SPHGasParticle.hpp \
    SPHGasParticleGrid.hpp \
    SPHGeometry.hpp \
    SPHStellarComp.hpp \
    SepAxGeometry.hpp \
    SequentialAssigner.hpp \
    SersicFunction.hpp \
    SersicGeometry.hpp \
    ShellGeometry.hpp \
    SignalHandler.hpp \
    SimpleInstrument.hpp \
    Simulation.hpp \
    SimulationItem.hpp \
    SingleFrameInstrument.hpp \
    SingleGrainSizeDistribution.hpp \
    SmoothingKernel.hpp \
    SolarPatchGeometry.hpp \
    SpecialFunctions.hpp \
    SpectralLuminosityStellarCompNormalization.hpp \
    SpheBackgroundGeometry.hpp \
    SpheGeometry.hpp \
    Sphere1DDustGrid.hpp \
    Sphere2DDustGrid.hpp \
    SphereDustGrid.hpp \
    SphericalAdaptiveMesh.hpp \
    SphericalAdaptiveMeshDustDistribution.hpp \
    SphericalCavityGeometryDecorator.hpp \
    SpheroidalGeometryDecorator.hpp \
    SpiralStructureGeometryDecorator.hpp \
    StaggeredAssigner.hpp \
    StarburstSED.hpp \
    StellarComp.hpp \
    StellarCompNormalization.hpp \
    StellarSED.hpp \
    StellarSurfaceGeometry.hpp \
    StellarSystem.hpp \
    StellarUnits.hpp \
    StokesVector.hpp \
    StopWatch.hpp \
    SunSED.hpp \
    SymPowMesh.hpp \
    TTauriDiskGeometry.hpp \
    TextInFile.hpp \
    TextOutFile.hpp \
    TimeLogger.hpp \
    TorusGeometry.hpp \
    TransientDustEmissivity.hpp \
    TreeDustGrid.hpp \
    TreeNode.hpp \
    TreeNodeBoxDensityCalculator.hpp \
    TreeNodeDensityCalculator.hpp \
    TreeNodeSampleDensityCalculator.hpp \
    TriaxialGeometryDecorator.hpp \
    Trust1Geometry.hpp \
    Trust2Geometry.hpp \
    Trust6Geometry.hpp \
    Trust7aGeometry.hpp \
    Trust7bGeometry.hpp \
    TrustDustMix.hpp \
    TrustGraphiteGrainComposition.hpp \
    TrustMeanDustMix.hpp \
    TrustNeutralPAHGrainComposition.hpp \
    TrustSilicateGrainComposition.hpp \
    TwoPhaseDustGrid.hpp \
    UniformCuboidGeometry.hpp \
    UniformSmoothingKernel.hpp \
    Units.hpp \
    VoronoiDustDistribution.hpp \
    VoronoiDustGrid.hpp \
    VoronoiGeometry.hpp \
    VoronoiMesh.hpp \
    VoronoiMeshAsciiFile.hpp \
    VoronoiMeshFile.hpp \
    VoronoiMeshInterface.hpp \
    VoronoiStellarComp.hpp \
    WavelengthGrid.hpp \
    WeingartnerDraineDustMix.hpp \
    XDustCompNormalization.hpp \
    YDustCompNormalization.hpp \
    ZDustCompNormalization.hpp \
    ZubkoDustMix.hpp \
    ZubkoSilicateGrainSizeDistribution.hpp \
    ZubkoGraphiteGrainSizeDistribution.hpp \
    ZubkoPAHGrainSizeDistribution.hpp \
    LyaMonteCarloSimulation.hpp \
    LyaWavelengthGrid.hpp \
    LyaStellarComp.hpp \
    LyaSpectrum.hpp \
    ContinuumLyaSpectrum.hpp \
    LineLyaSpectrum.hpp \
    MoveableMesh.hpp \
    AnchoredMesh.hpp \
    LogMesh.hpp \
    HIDistribution.hpp \
    HISystem.hpp \
    AnalyticalHIDistribution.hpp \
    StaticSphereHIDistribution.hpp

SOURCES += \
    AdaptiveMesh.cpp \
    AdaptiveMeshAmrvacFile.cpp \
    AdaptiveMeshAsciiFile.cpp \
    AdaptiveMeshDustDistribution.cpp \
    AdaptiveMeshDustGrid.cpp \
    AdaptiveMeshFile.cpp \
    AdaptiveMeshGeometry.cpp \
    AdaptiveMeshNode.cpp \
    AdaptiveMeshStellarComp.cpp \
    AllCellsDustLib.cpp \
    AmHydrocarbonGrainComposition.cpp \
    AxGeometry.cpp \
    BaryBinTreeNode.cpp \
    BaryOctTreeNode.cpp \
    Benchmark1DDustMix.cpp \
    Benchmark2DDustMix.cpp \
    BinTreeDustGrid.cpp \
    BinTreeNode.cpp \
    BlackBodySED.cpp \
    BolLuminosityStellarCompNormalization.cpp \
    BoxDustGrid.cpp \
    BruzualCharlotSED.cpp \
    BruzualCharlotSEDFamily.cpp \
    CartesianDustGrid.cpp \
    ClumpyGeometryDecorator.cpp \
    CombineGeometryDecorator.cpp \
    CompDustDistribution.cpp \
    ConfigurableDustMix.cpp \
    ConicalShellGeometry.cpp \
    Console.cpp \
    CropGeometryDecorator.cpp \
    CubBackgroundGeometry.cpp \
    CubicSplineSmoothingKernel.cpp \
    Cylinder2DDustGrid.cpp \
    CylinderDustGrid.cpp \
    CylindricalCavityGeometryDecorator.cpp \
    Dim1DustLib.cpp \
    Dim2DustLib.cpp \
    Direction.cpp \
    DistantInstrument.cpp \
    DraineGraphiteGrainComposition.cpp \
    DraineIonizedPAHGrainComposition.cpp \
    DraineLiDustMix.cpp \
    DraineNeutralPAHGrainComposition.cpp \
    DraineSilicateGrainComposition.cpp \
    DustComp.cpp \
    DustCompNormalization.cpp \
    DustDistribution.cpp \
    DustEmGrainComposition.cpp \
    DustEmissivity.cpp \
    DustGrid.cpp \
    DustGridPath.cpp \
    DustGridPlotFile.cpp \
    DustLib.cpp \
    DustMassDustCompNormalization.cpp \
    DustMix.cpp \
    DustMixPopulation.cpp \
    DustSystem.cpp \
    DustSystemDensityCalculator.cpp \
    DustSystemDepthCalculator.cpp \
    EdgeOnDustCompNormalization.cpp \
    EinastoGeometry.cpp \
    ElectronDustMix.cpp \
    EnstatiteGrainComposition.cpp \
    ExpDiskGeometry.cpp \
    ExtragalacticUnits.cpp \
    FITSInOut.cpp \
    FaceOnDustCompNormalization.cpp \
    FatalError.cpp \
    FileGrainComposition.cpp \
    FileLog.cpp \
    FilePaths.cpp \
    FileSED.cpp \
    FileWavelengthGrid.cpp \
    Foam.cpp \
    FoamAxGeometry.cpp \
    FoamCell.cpp \
    FoamGeometry.cpp \
    FoamGeometryDecorator.cpp \
    FoamHistogram.cpp \
    FoamMatrix.cpp \
    FoamPartition.cpp \
    FoamVector.cpp \
    ForsteriteGrainComposition.cpp \
    FrameInstrument.cpp \
    FullInstrument.cpp \
    GammaGeometry.cpp \
    GaussianGeometry.cpp \
    GenGeometry.cpp \
    GeometricStellarComp.cpp \
    Geometry.cpp \
    GrainComposition.cpp \
    GrainSizeDistribution.cpp \
    GreyBodyDustEmissivity.cpp \
    HomogeneousTransform.cpp \
    ISRF.cpp \
    IdenticalAssigner.cpp \
    Image.cpp \
    Instrument.cpp \
    InstrumentFrame.cpp \
    InstrumentSystem.cpp \
    InterstellarDustMix.cpp \
    KuruczSED.cpp \
    LaserGeometry.cpp \
    LinMesh.cpp \
    Log.cpp \
    LogNormalGrainSizeDistribution.cpp \
    LogWavelengthGrid.cpp \
    LuminosityStellarCompNormalization.cpp \
    MGEGeometry.cpp \
    MRNDustMix.cpp \
    MappingsSED.cpp \
    MappingsSEDFamily.cpp \
    MarastonSED.cpp \
    MasterSlaveCommunicator.cpp \
    MeanZubkoDustMix.cpp \
    Mesh.cpp \
    MeshDustComponent.cpp \
    MieSilicateGrainComposition.cpp \
    MinSilicateGrainComposition.cpp \
    ModifiedLogNormalGrainSizeDistribution.cpp \
    ModifiedPowerLawGrainSizeDistribution.cpp \
    MonteCarloSimulation.cpp \
    MultiFrameInstrument.cpp \
    MultiGrainDustMix.cpp \
    NestedLogWavelengthGrid.cpp \
    NetzerAccretionDiskGeometry.cpp \
    OctTreeDustGrid.cpp \
    OctTreeNode.cpp \
    OffsetGeometryDecorator.cpp \
    OligoDustSystem.cpp \
    OligoMonteCarloSimulation.cpp \
    OligoStellarComp.cpp \
    OligoWavelengthGrid.cpp \
    PanDustSystem.cpp \
    PanMonteCarloSimulation.cpp \
    PanStellarComp.cpp \
    PanWavelengthGrid.cpp \
    Parallel.cpp \
    ParallelFactory.cpp \
    ParallelTarget.cpp \
    ParticleTreeDustGrid.cpp \
    PeerToPeerCommunicator.cpp \
    PegaseSED.cpp \
    PerspectiveInstrument.cpp \
    PhotonPackage.cpp \
    PlanckFunction.cpp \
    PlummerGeometry.cpp \
    PointGeometry.cpp \
    PolarizedGraphiteGrainComposition.cpp \
    PolarizedSilicateGrainComposition.cpp \
    Position.cpp \
    PowMesh.cpp \
    PowerLawGrainSizeDistribution.cpp \
    ProcessAssigner.cpp \
    ProcessCommunicator.cpp \
    PseudoSersicGeometry.cpp \
    QuasarSED.cpp \
    RadialDustCompNormalization.cpp \
    Random.cpp \
    RandomAssigner.cpp \
    RangeGrainSizeDistribution.cpp \
    ReadFitsGeometry.cpp \
    RingGeometry.cpp \
    RootAssigner.cpp \
    RotateGeometryDecorator.cpp \
    SED.cpp \
    SEDFamily.cpp \
    SEDInstrument.cpp \
    SIUnits.cpp \
    SPHDustDistribution.cpp \
    SPHGasParticle.cpp \
    SPHGasParticleGrid.cpp \
    SPHGeometry.cpp \
    SPHStellarComp.cpp \
    SepAxGeometry.cpp \
    SequentialAssigner.cpp \
    SersicFunction.cpp \
    SersicGeometry.cpp \
    ShellGeometry.cpp \
    SignalHandler.cpp \
    SimpleInstrument.cpp \
    Simulation.cpp \
    SimulationItem.cpp \
    SingleFrameInstrument.cpp \
    SingleGrainSizeDistribution.cpp \
    SmoothingKernel.cpp \
    SolarPatchGeometry.cpp \
    SpecialFunctions.cpp \
    SpectralLuminosityStellarCompNormalization.cpp \
    SpheBackgroundGeometry.cpp \
    SpheGeometry.cpp \
    Sphere1DDustGrid.cpp \
    Sphere2DDustGrid.cpp \
    SphereDustGrid.cpp \
    SphericalAdaptiveMesh.cpp \
    SphericalAdaptiveMeshDustDistribution.cpp \
    SphericalCavityGeometryDecorator.cpp \
    SpheroidalGeometryDecorator.cpp \
    SpiralStructureGeometryDecorator.cpp \
    StaggeredAssigner.cpp \
    StarburstSED.cpp \
    StellarComp.cpp \
    StellarCompNormalization.cpp \
    StellarSED.cpp \
    StellarSurfaceGeometry.cpp \
    StellarSystem.cpp \
    StellarUnits.cpp \
    StokesVector.cpp \
    StopWatch.cpp \
    SunSED.cpp \
    SymPowMesh.cpp \
    TTauriDiskGeometry.cpp \
    TextInFile.cpp \
    TextOutFile.cpp \
    TimeLogger.cpp \
    TorusGeometry.cpp \
    TransientDustEmissivity.cpp \
    TreeDustGrid.cpp \
    TreeNode.cpp \
    TreeNodeBoxDensityCalculator.cpp \
    TreeNodeSampleDensityCalculator.cpp \
    TriaxialGeometryDecorator.cpp \
    Trust1Geometry.cpp \
    Trust2Geometry.cpp \
    Trust6Geometry.cpp \
    Trust7aGeometry.cpp \
    Trust7bGeometry.cpp \
    TrustDustMix.cpp \
    TrustGraphiteGrainComposition.cpp \
    TrustMeanDustMix.cpp \
    TrustNeutralPAHGrainComposition.cpp \
    TrustSilicateGrainComposition.cpp \
    TwoPhaseDustGrid.cpp \
    UniformCuboidGeometry.cpp \
    UniformSmoothingKernel.cpp \
    Units.cpp \
    VoronoiDustDistribution.cpp \
    VoronoiDustGrid.cpp \
    VoronoiGeometry.cpp \
    VoronoiMesh.cpp \
    VoronoiMeshAsciiFile.cpp \
    VoronoiMeshFile.cpp \
    VoronoiStellarComp.cpp \
    WavelengthGrid.cpp \
    WeingartnerDraineDustMix.cpp \
    XDustCompNormalization.cpp \
    YDustCompNormalization.cpp \
    ZDustCompNormalization.cpp \
    ZubkoDustMix.cpp \
    ZubkoSilicateGrainSizeDistribution.cpp \
    ZubkoGraphiteGrainSizeDistribution.cpp \
    ZubkoPAHGrainSizeDistribution.cpp \
    LyaWavelengthGrid.cpp \
    LyaMonteCarloSimulation.cpp \
    LyaStellarComp.cpp \
    LyaSpectrum.cpp \
    ContinuumLyaSpectrum.cpp \
    LineLyaSpectrum.cpp \
    MoveableMesh.cpp \
    AnchoredMesh.cpp \
    LogMesh.cpp \
    HIDistribution.cpp \
    HISystem.cpp \
    AnalyticalHIDistribution.cpp \
    StaticSphereHIDistribution.cpp
