const {Router} = require('express');
const { listAllCharacter,
        listData,
        addCharacter,
        updateCharacter,
        deleteCharacter        
      } = require ('../controllers/users')

const router = Router();

router.get('/',listAllCharacter);

http://localhost:3000/api/v1/search$q=Yanit
router.get('/search',listData)

router.put('/',addCharacter);

router.patch('/:id',updateCharacter);

router.delete('/:id',deleteCharacter);

module.exports= router;