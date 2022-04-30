const toCamel = (str: string): string => {
  return str.replace(/([-_][a-z])/ig, ($1) => {
    return $1.toUpperCase()
      .replace('-', '')
      .replace('_', '');
  });
};

const isObject = function (obj: any) {
  return obj === Object(obj) && !Array.isArray(obj) && typeof obj !== 'function';
};

const keysToCamel = (obj: Object): Object => {
  if (isObject(obj) && !(obj instanceof Date)) {
    const n: any = {};

    Object.keys(obj)
      .forEach((k) => {
        n[toCamel(k) as any] = keysToCamel((obj as any)[k]);
      });

    return n;
  } else if (Array.isArray(obj)) {
    return obj.map((i) => {
      return keysToCamel(i);
    });
  }
  
  return obj;
};

export default keysToCamel;