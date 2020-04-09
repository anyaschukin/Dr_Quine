GREEN=\033[1;32m
RESET=\033[0m

COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

NAME = $(COLLEEN) $(GRACE) $(SULLY)

SRC_COLLEEN = Colleen.s
SRC_GRACE = Grace.s
SRC_SULLY = Sully.s

OBJ_COLLEEN = $(SRC_COLLEEN:.s=.o)
OBJ_GRACE = $(SRC_GRACE:.s=.o)
OBJ_SULLY = $(SRC_SULLY:.s=.o)

FLAGS = -f macho64

all: $(NAME)

$(OBJ_COLLEEN): $(SRC_COLLEEN)
	@nasm $(FLAGS) $(SRC_COLLEEN)
	@gcc $(OBJ_COLLEEN) -o $(COLLEEN)
	@echo "${GREEN}Colleen compiled!${RESET}"

$(OBJ_GRACE): $(SRC_GRACE)
	@nasm $(FLAGS) $(SRC_GRACE)
	@gcc $(OBJ_GRACE) -o $(GRACE)
	@echo "${GREEN}Grace compiled!${RESET}"

$(OBJ_SULLY): $(SRC_SULLY)
	@nasm $(FLAGS) $(SRC_SULLY)
	@gcc $(OBJ_SULLY) -o $(SULLY)
	@echo "${GREEN}Sully compiled!${RESET}"

clean:
	@rm -rf $(OBJ_COLLEEN)
	@rm -rf $(OBJ_GRACE)
	@rm -rf $(OBJ_SULLY)

fclean: clean
	@rm -rf $(COLLEEN)
	@rm -rf $(GRACE)
	@rm -rf $(SULLY)

re: fclean all

.PHONY : all clean fclean re