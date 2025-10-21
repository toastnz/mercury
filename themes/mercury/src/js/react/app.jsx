import { Canvas } from '@react-three/fiber'
import { CameraControls, Plane, SoftShadows } from '@react-three/drei'
import React, { useState, useRef } from 'react'
import { Controls } from './controls'
import { Vehicle } from './vehicle'
import { Perf } from 'r3f-perf'
import { EffectComposer, Vignette, N8AO, DepthOfField } from '@react-three/postprocessing'
import { Physics, RigidBody, CuboidCollider } from "@react-three/rapier";


const MemoCameraControls = React.memo((props) => <CameraControls {...props} />);

export default function App(props) {

    const [backColour, setBackColour] = useState('#777777');
    const [floorColour, setFloorColour] = useState('#888888');
    const [lightIntensity, setLightIntensity] = useState(2);

    return (
        <Canvas shadows camera={{ position: [10, 5, -16], fov: 50 }}>

            <Physics>
                <SoftShadows size={15} samples={10} focus={0} />

                <color attach="background" args={[backColour]} />
                <fog attach="fog" args={[backColour, 20, 80]} />

                <group>
                    <ambientLight intensity={lightIntensity} />
                    <directionalLight castShadow position={[2.5, 8, 5]} intensity={4} shadow-mapSize={1024}>
                        <orthographicCamera attach="shadow-camera" args={[-10, 10, -10, 10, 0.1, 50]} />
                    </directionalLight>
                    <pointLight position={[-10, 0, -20]} color="white" intensity={1} />
                    <pointLight position={[0, -10, 0]} intensity={1} />
                </group>

                <Vehicle
                    position={[0, 2, 0]}
                    style={{ cursor: 'pointer' }}
                />


                <RigidBody type="fixed" colliders={false}>
                    <Plane receiveShadow args={[200, 200]} rotation-x={-Math.PI / 2} position={[0, 0, 0]}>
                        <meshStandardMaterial color={floorColour} />
                    </Plane>
                    <CuboidCollider
                        args={[100, 0.1, 100]} // half extents: [width/2, height/2, depth/2]
                        position={[0, 0, 0]}
                    />
                </RigidBody>

                <MemoCameraControls minPolarAngle={Math.PI / 4.5} maxPolarAngle={Math.PI / 2.1} />

                <Controls
                    onBackColourChange={setBackColour}
                    onFloorColourChange={setFloorColour}
                    onLightIntensityChange={setLightIntensity}
                />

                <EffectComposer>
                    <Vignette eskil={false} offset={0.1} darkness={0.75} />
                </EffectComposer>


                {props.isDev && (
                    <group>
                        <Perf position="top-left" minimal showGraph={false} />
                    </group>
                )}

            </Physics>
        </Canvas>
    );
}

