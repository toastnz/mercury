import { Canvas } from '@react-three/fiber'
import { CameraControls, Plane, SoftShadows } from '@react-three/drei'
import React, { useState } from 'react'
import { Controls } from './controls'
import { Tree } from './tree'
import { Man } from './man'
import { Perf } from 'r3f-perf'
import { EffectComposer, Vignette, N8AO } from '@react-three/postprocessing'


const MemoCameraControls = React.memo((props) => <CameraControls {...props} />);

export default function App(props) {

    const [backColour, setBackColour] = useState('#83a07b');
    const [floorColour, setFloorColour] = useState('#aed5a3');
    const [lightIntensity, setLightIntensity] = useState(2);

    return (
        <Canvas shadows camera={{ position: [10, 5, -16], fov: 50 }}>
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

            <Plane receiveShadow args={[200, 200]} rotation-x={-Math.PI / 2} position={[0, 0, 0]}>
                <meshStandardMaterial color={floorColour} />
            </Plane>


            <Tree position={[0, 0, 0]} />
            <Man position={[2, 0, 1]} />

            <MemoCameraControls minPolarAngle={Math.PI / 4.5} maxPolarAngle={Math.PI / 2.1} />

            <Controls
                onBackColourChange={setBackColour}
                onFloorColourChange={setFloorColour}
                onLightIntensityChange={setLightIntensity}
            />

            {/* <EffectComposer>
                <N8AO aoRadius={1} intensity={2} />
                <Vignette eskil={false} offset={0.1} darkness={0.75} />
            </EffectComposer> */}

            {props.isDev && (
                <group>
                    <Perf position="top-left" minimal showGraph={false} />
                </group>
            )}

        </Canvas>
    );
}

