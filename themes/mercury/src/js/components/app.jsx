'use client'
import { Canvas } from '@react-three/fiber'
import { Backdrop, CameraControls, Plane } from '@react-three/drei'
import { Stats, SoftShadows, Sky } from '@react-three/drei'
import { useState } from 'react'
import { Controls } from './controls'
import { Model } from './model'
import { Perf } from 'r3f-perf'


export default function App(props) {

    const [backColour, setBackColour] = useState();
    const [floorColour, setFloorColour] = useState();
    const [lightIntensity, setLightIntensity] = useState();

    return (
        <Canvas flat shadows className="w-full h-full" camera={{ position: [10, 5, -16], fov: 50 }}>

            <color attach="background" args={[backColour]} /> {/* Set your desired background color here */}

            {/* <Sky distance={450000} sunPosition={[0, 1, 0]} inclination={0} azimuth={0.25} rayleigh={0.12} /> */}
            <SoftShadows size={15} samples={10} focus={0} />
            <ambientLight intensity={lightIntensity} />

            <fog attach="fog" args={[backColour, 20, 80]} />
            <directionalLight castShadow position={[2.5, 8, 5]} intensity={1.5} shadow-mapSize={1024}>
                <orthographicCamera attach="shadow-camera" args={[-10, 10, -10, 10, 0.1, 50]} />
            </directionalLight>
            <pointLight position={[-10, 0, -20]} color="white" intensity={1} />
            <pointLight position={[0, -10, 0]} intensity={1} />
            <Plane receiveShadow args={[1000, 1000]} rotation-x={-Math.PI / 2} position={[0, 0, 0]}>
                <meshStandardMaterial color={floorColour} />
            </Plane>
            <Model position={[0, 0, 0]} />
            <CameraControls minPolarAngle={0} maxPolarAngle={Math.PI / 1.6} />
            {props.isDev && (
                <>
                    <Stats />
                    <Perf position="bottom-right" />
                </>
            )}
            <Controls
                onBackColourChange={setBackColour}
                onColorChange={setFloorColour}
                onLightIntensityChange={setLightIntensity}
            />
        </Canvas>
    );
}

