const { request, response } = require('express');
const pool = require('../db');
const CharacterModel = require('../models/users');

/**
 * ENDPOINT READ
 * para listar toda la informacion
 */
const listAllCharacter = async (req = request, res = response) => {
    let conn;

    try {
        conn = await pool.getConnection();

        const Characters = await conn.query(CharacterModel.getAll, (err) =>{
            if(err){
                throw err
            }
        });
        
        res.json(Characters);
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }finally{
        if (conn) conn.end();
    }
}

/**
 * ENDPOINT READ
 * para listar informacion en base a un criterio
 */
const listData = async (req = request, res = response) => {
    let conn;
    const { q } = req.query; // Obtén el valor de 'q' de la consulta

    try {
        conn = await pool.getConnection();

        if (!q) {
            res.status(400).json({ msg: 'Missing search parameter' });
            return;
        }

        const sql = CharacterModel.getData;
        const query = `%${q}%`;

        const Characters = await conn.query(sql, [query, query, query, query, query], (err) => {
            if (err) {
                throw err;
            }
        });
        
        if (Characters.length > 0) {
            res.json({ msg: 'Results found:', data: Characters });
        } else {
            res.status(404).json({ msg: 'No matches were found.' });
        }
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }finally{
        if (conn) conn.end();
    }
}

/**
 * ENDPOINT CREATE
 * para agregar un nuevo registro
 */
const addCharacter = async (req = request, res = response)=>{
    
    const {
        Name,
        Intro_Chapter,
        Intro_Episode,
        is_active = 1,
        Intro_Year,
        Note
    } =req.body;

    if (!Name || !Intro_Year ){
        res.status(400).json({msg: "Missing information"});
        return;
    }

    const Character = [
        Name,
        Intro_Chapter,
        Intro_Episode,
        is_active,
        Intro_Year,
        Note 
        ];
    
    let conn ;

    try{
        conn = await pool.getConnection();
    //---------------------
        const [nameCharacter] = await conn.query(
            CharacterModel.getByName,
            [Name],
            (err)=>{if(err)throw err;}
        );
        if (nameCharacter){
            res.status(404).json({msg: `Character with name ${Name} already exists`});
            return;
        }
    //---------------------
        const CharacterAdded = await conn.query(
            CharacterModel.addCharacter, 
            [...Character], 
            (err)=>{if(err)throw err;
        });


        if (CharacterAdded.affectecRows === 0)throw new Error ({message: 'Failed to add Character'});
        res.json({msg: "Character added successfully"});

    }catch(error){
        console.log(error);
        res.status(500).json(error);
    }finally{
        if (conn) conn.end();
    }

}


/**
 * ENDPOINT UPDATE
 * para actualizar o modificar datos
 */
const updateCharacter =async (req =request, res= response) =>{
    const {id} = req.params;// Captura el ID de los parámetros en la URL

    if (isNaN(id)){
        res.status(404).json({msg: 'Invalid ID'});
        return;
    }

    const {
        Name,
        Intro_Chapter,
        Intro_Episode,
        is_active = 1,
        Intro_Year,
        Note
    } =req.body;

    let Character = [
        Name,
        Intro_Chapter,
        Intro_Episode,
        is_active,
        Intro_Year,
        Note 
    ];
    
    let conn;

    try{
        conn = await pool.getConnection();

        const [CharacterExists] = await conn.query(
            CharacterModel.getByID,
            [id],
            (err)=> {throw err;}
        )
        
        if (!CharacterExists || CharacterExists.is_active===0) {
            res.status(404).json({msg: 'Character not found'})
            return;
        }

    //---------------------
        const [nameCharacter] = await conn.query(
            CharacterModel.getByName,
            [Name],
            (err)=>{if(err)throw err;}
        );
        if (nameCharacter){
            res.status(404).json({msg: `Character with name ${Name} already exists`});
            return;
        }
   
        let oldCharacter = [
            CharacterExists.Name,
            CharacterExists.Intro_Chapter,
            CharacterExists.Intro_Episode,
            CharacterExists.is_active,
            CharacterExists.Intro_Year,
            CharacterExists.Note 
        ]
        
        Character.forEach((CharacterData, index)=>{
                if (!CharacterData) {
                    Character[index] = oldCharacter[index]
                };
            })

            const CharacterUpdated = conn.query(
                CharacterModel.updateByID, 
                [...Character, id],
                (err) => {
                    throw err;
                }
                )
            if (CharacterUpdated.affectedRows===0){
                throw new Error('Character not updated');
            }
            res.json({msg:'Character updated successfully'});
    }catch(error){
        console.log(error);
        res.status(500).json(error);
        } finally {
            if (conn) conn.end();
        }
}


/**DUDAS EN SI DE ESTA MANERA ESTA BIEN O DEBE ELIMINARSE EL REGISTRO DE LA BD
 * ENDPOINT DELETE
 * para eliminar registro
 */
const deleteCharacter = async (req= request, res = response)=>{
    let conn;
    const {id} = req.params;
    
    if (isNaN(id)){
        res.status(404).json({msg: 'Invalid ID'});
        return;
    }
    
    try{
        conn = await pool.getConnection();
    
        const [CharacterExists] = await conn.query(
            CharacterModel.getByID,
            [id],
            (err)=> {throw err;}
        )
        
        if (!CharacterExists || CharacterExists.is_active===0) {
            res.status(404).json({msg: 'Character not found'})
            return;
        }
        
        const CharacterDeleted = await conn.query(
            CharacterModel.deleteRow,
            [id],
            (err) => {if (err) throw err;}
        )
        
        if(CharacterDeleted.affectedRows === 0){
            throw new Error ({message: 'Failed to delete Character'})
        };
    
        res.json({msg: 'Character deleted succesfully'});
    
    }catch (error){
        console.log(error)
        res.status(500).json(error);
    }finally{
        if (conn) conn.end();
    }
    }    

module.exports = {listAllCharacter, listData, addCharacter, updateCharacter, deleteCharacter}