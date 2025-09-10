import { Canvas } from '@react-three/fiber'
import { CameraControls, Plane } from '@react-three/drei'
import { Stats, SoftShadows } from '@react-three/drei'
import { useState } from 'react'
import { Controls } from './controls'
import { Model } from './model'
import { Perf } from 'r3f-perf'
import { EffectComposer, Vignette } from '@react-three/postprocessing'


export default function App(props) {

    const [backColour, setBackColour] = useState();
    const [floorColour, setFloorColour] = useState();
    const [lightIntensity, setLightIntensity] = useState();

    return (
        <Canvas flat shadows camera={{ position: [10, 5, -16], fov: 50 }}>
            <SoftShadows size={15} samples={10} focus={0} />

            <color attach="background" args={[backColour]} />
            <fog attach="fog" args={[backColour, 20, 80]} />

            <group>
                <ambientLight intensity={lightIntensity} />
                <directionalLight castShadow position={[2.5, 8, 5]} intensity={1.5} shadow-mapSize={1024}>
                    <orthographicCamera attach="shadow-camera" args={[-10, 10, -10, 10, 0.1, 50]} />
                </directionalLight>
                <pointLight position={[-10, 0, -20]} color="white" intensity={1} />
                <pointLight position={[0, -10, 0]} intensity={1} />
            </group>

            <Plane receiveShadow args={[1000, 1000]} rotation-x={-Math.PI / 2} position={[0, 0, 0]}>
                <meshStandardMaterial color={floorColour} />
            </Plane>

            <Model position={[0, 0, 0]} />

            {props.isDev && (
                <group>
                    <Stats />
                    <Perf position="bottom-right" />
                </group>
            )}

            <CameraControls minPolarAngle={Math.PI / 4.5} maxPolarAngle={Math.PI / 2.1} />
            <Controls
                onBackColourChange={setBackColour}
                onColorChange={setFloorColour}
                onLightIntensityChange={setLightIntensity}
            />
            <EffectComposer>
                <Vignette eskil={false} offset={0.1} darkness={0.75} />
            </EffectComposer>
        </Canvas>
    );
}

