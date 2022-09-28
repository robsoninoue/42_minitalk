/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_bzero.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rotakesh <rotakesh@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/20 09:58:11 by rotakesh          #+#    #+#             */
/*   Updated: 2022/01/19 14:29:38 by rotakesh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_bzero(void *b, size_t n)
{
	char	*pointer;
	size_t	i;

	pointer = b;
	i = 0;
	while (i < n)
	{
		pointer[i] = '\0';
		i++;
	}
}
