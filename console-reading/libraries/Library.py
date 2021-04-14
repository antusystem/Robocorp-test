from robot.api import logger


class Library:
    """Give this library a proper name and document it."""

    def example_python_keyword(self):
        logger.info("This is Python!")
        
    def cut_string(self, stringg):
        start = stringg.find('aaj-desktop')
        finish = stringg.find('\nale@AAJ-desktop:~$')
        text = ''
        logger.info("Start es: ", start)
        logger.info("finish es: ", finish)
        for x in (stringg[start:finish]):
            text = text + x
        return text
    
    def search(self, stringg, srch):
        start = stringg.find(srch)
        finish = stringg.find('\n', start)
        text = ''
        logger.info("Start es: ", start)
        print('Start es: ', start)
        print('Finish es: ', finish)
        logger.info("finish es: ", finish)
        for x in (stringg[start:finish]):
            text = text + x
        return text
