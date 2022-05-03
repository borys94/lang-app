import axios, { Method } from 'axios';
import { useState } from 'react';

type Props = {
  url: string,
  method: "get" | "post" | "delete" | "put",
  body ?: any,
  onSuccess: (data: any) => void
}

type Errors = {
  field: string;
  message: string
}[]

type Response = {

}

export default ({ url, method, body, onSuccess }: Props): [Function, Errors | null] => {
  const [errors, setErrors] = useState<Errors | null>(null);

  const doRequest = async (props = {}) => {
    try {
      setErrors(null);
      const response = await axios[method](url, { ...body, ...props });

      if (onSuccess) {
        onSuccess(response.data);
      }

      return response.data;
    } catch (err: any) {
      setErrors(err.response.data.errors)
    }
  };

  return [doRequest, errors ];
};