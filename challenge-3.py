def lookup(object:dict,keys:str):

    assert type(keys)==str and type(object)==dict, "INVALID INPUTS. object should be of dict type and keys should be of str type"


    #Remove trailing slash
    if keys[-1]=='/':
        keys=keys[:-1]

    keys=keys.split('/')

    # print(keys)
    for key in keys:
        try:
            if type(object)==dict:
                object=object[key]
            else:return None
        except KeyError:
            return None

    return object

if __name__=="__main__":
	object = {"x": {"y": {"z": "a"}}}
	keys='x/y/z'
	print(lookup(object,keys))