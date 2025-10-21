import React, { useRef } from 'react'
import { useGLTF } from '@react-three/drei'
import { useFrame } from '@react-three/fiber'

export const Vehicle = React.forwardRef((props, ref) => {
    const group = useRef();
    const { nodes, materials } = useGLTF('_resources/themes/mercury/dist/models/vehicle.glb');
    
    // Create refs for each wheel
    const frontLeftWheel = useRef();
    const frontRightWheel = useRef();
    const backLeftWheel = useRef();
    const backRightWheel = useRef();

    // Animate wheels
    useFrame((state, delta) => {
        const rotationSpeed = 1; // Adjust speed as needed
        
        if (frontLeftWheel.current) {
            frontLeftWheel.current.rotation.x += rotationSpeed * delta;
        }
        if (frontRightWheel.current) {
            frontRightWheel.current.rotation.x += rotationSpeed * delta;
        }
        if (backLeftWheel.current) {
            backLeftWheel.current.rotation.x += rotationSpeed * delta;
        }
        if (backRightWheel.current) {
            backRightWheel.current.rotation.x += rotationSpeed * delta;
        }
    });

    const handleClick = () => {
        if (ref && ref.current) {
            ref.current.applyImpulse({ x: 0, y: 5, z: 0 }, true);
        }
    };

    return (
        <group ref={group} {...props} dispose={null} onClick={handleClick} rotation={[0, 1.5, 0]} scale={2} position={[0, 0, 0]}>
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.bumper_f_part.geometry}
                material={materials.GLASS}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.bumper_f_part001.geometry}
                material={materials['Black Plastic']}
            />
            <mesh castShadow receiveShadow geometry={nodes.paint.geometry} material={materials.PAINT} />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.bumper_f_part003.geometry}
                material={materials.clearglass}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.bumper_f_part004.geometry}
                material={materials.chrome}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.bumper_f_part005.geometry}
                material={materials.orangeglass}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.bumper_f_part006.geometry}
                material={materials.interior}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.bumper_f_part007.geometry}
                material={materials.mirror}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes.bumper_f_part008.geometry}
                material={materials.redglass}
            />
            
            {/* Front Right Wheel */}
            <group ref={frontRightWheel} position={[0.777, 0.405, -1.355]}>
                <mesh
                    castShadow
                    receiveShadow
                    geometry={nodes.wheel.geometry}
                    material={materials['TYRE RUBBER']}
                    position={[0, 0, 0]}
                    scale={0.595}
                />
                <group position={[-0.012, 0, 0.006]} scale={0.595}>
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder001.geometry}
                        material={materials['Black Plastic']}
                    />
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder001_1.geometry}
                        material={materials['gold_mat.001']}
                    />
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder001_2.geometry}
                        material={materials['stil_mat.001']}
                    />
                </group>
            </group>
            
            {/* Front Left Wheel */}
            <group ref={frontLeftWheel} position={[-0.755, 0.405, -1.355]}>
                <mesh
                    castShadow
                    receiveShadow
                    geometry={nodes.wheel006.geometry}
                    material={materials['TYRE RUBBER']}
                    position={[0, 0, 0]}
                    scale={0.595}
                />
                <group position={[0.012, 0, -0.006]} rotation={[Math.PI, 0, Math.PI]} scale={0.595}>
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder006.geometry}
                        material={materials['Black Plastic']}
                    />
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder006_1.geometry}
                        material={materials['gold_mat.001']}
                    />
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder006_2.geometry}
                        material={materials['stil_mat.001']}
                    />
                </group>
            </group>
            
            {/* Back Right Wheel */}
            <group ref={backRightWheel} position={[0.777, 0.411, 1.738]}>
                <mesh
                    castShadow
                    receiveShadow
                    geometry={nodes.wheel002.geometry}
                    material={materials['TYRE RUBBER']}
                    position={[0, 0, 0]}
                    scale={0.595}
                />
                <group position={[-0.012, 0, 0.005]} scale={0.595}>
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder005.geometry}
                        material={materials['Black Plastic']}
                    />
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder005_1.geometry}
                        material={materials['gold_mat.001']}
                    />
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder005_2.geometry}
                        material={materials['stil_mat.001']}
                    />
                </group>
            </group>
            
            {/* Back Left Wheel */}
            <group ref={backLeftWheel} position={[-0.762, 0.411, 1.738]}>
                <mesh
                    castShadow
                    receiveShadow
                    geometry={nodes.wheel004.geometry}
                    material={materials['TYRE RUBBER']}
                    position={[0, 0, 0]}
                    scale={0.595}
                />
                <group position={[0.012, 0, -0.006]} rotation={[Math.PI, 0, Math.PI]} scale={0.595}>
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder003.geometry}
                        material={materials['Black Plastic']}
                    />
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder003_1.geometry}
                        material={materials['gold_mat.001']}
                    />
                    <mesh
                        castShadow
                        receiveShadow
                        geometry={nodes.disk_back_Cylinder003_2.geometry}
                        material={materials['stil_mat.001']}
                    />
                </group>
            </group>
        </group>
    )
})

useGLTF.preload('_resources/themes/mercury/dist/models/vehicle.glb')