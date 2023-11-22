const CharacterModel = {
    getAll: `SELECT * FROM dbchapters WHERE is_active = 1`,

    getByName: `SELECT * FROM 
                dbchapters WHERE
                Name=?`,

    getByID: `SELECT * FROM dbchapters WHERE id = ?`,

    getData: `
            SELECT * FROM dbchapters
            WHERE
                Name LIKE ? OR
                Intro_Chapter LIKE ? OR
                Intro_Episode LIKE ? OR
                Intro_Year LIKE ? OR
                Note LIKE ?
            `,
      
    addCharacter: 
            `INSERT INTO dbchapters (
                Name,
                Intro_Chapter,
                Intro_Episode,
                is_active,
                Intro_Year,
                Note
            )
            VALUES (?, ?, ?, ?, ?, ?)`,

    updateByID: `
            UPDATE dbchapters 
                SET 
                    Name=?, 
                    Intro_Chapter=?, 
                    Intro_Episode=?, 
                    is_active=?, 
                    Intro_Year=?, 
                    Note=? 
            WHERE id=?`,

    deleteRow:`
            UPDATE 
                dbchapters
            SET
                is_active = 0
            WHERE
                id = ?
        `,
}

module.exports = CharacterModel;